//
//  DetailsViewController.m
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "DetailsViewController.h"
#import "QuestsViewController.h"

//@interface DetailsViewController ()
//
//@end

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
    
    NSString *d = whatQuest;
     NSString *path = [[NSBundle mainBundle] pathForResource:@"questDetails" ofType:@"plist"];
     questDetails = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSArray *details = [NSArray arrayWithArray:[questDetails objectForKey:d]];
    
    
    _questNameTextLabel.text = d;
    _questDetailsView.text = [details objectAtIndex:2];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
