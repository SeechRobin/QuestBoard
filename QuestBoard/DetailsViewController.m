//
//  DetailsViewController.m
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "DetailsViewController.h"
#import "QuestsViewController.h"


@implementation DetailsViewController
{
    NSDictionary *questDetails;
    NSString *whatQuest;
}
@synthesize questNameTextLabel = _questNameTextLabel;
@synthesize questDetailsView = _questDetailsView;
@synthesize quest = _quest;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setQuest:(NSString *)quest
{
    whatQuest = quest;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *split;
    NSString *splitGiver;
    NSString *d = whatQuest;
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questDetails" ofType:@"plist"];
    questDetails = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *details = [NSArray arrayWithArray:[questDetails objectForKey:d]];
    _questNameTextLabel.text = d;
    _questDetailsView.text = [details objectAtIndex:2];
    
    
    
    // The location of the quest.
    split = [details objectAtIndex:3];
    NSArray *splitArray = [split componentsSeparatedByString:@","];
    
    double lat = [[splitArray objectAtIndex:0] doubleValue];
    double lon = [[splitArray objectAtIndex:1] doubleValue];

    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"The Quest is Here!";
    [annotation setCoordinate:coord];
    [self.mapView setRegion:region];
    [self.mapView addAnnotation:annotation];
    

    
    
    
	
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
