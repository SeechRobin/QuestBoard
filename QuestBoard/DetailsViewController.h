//
//  DetailsViewController.h
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>


@interface DetailsViewController : ViewController <MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *questNameTextLabel;
@property (strong, nonatomic) IBOutlet UITextView *questDetailsView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic) NSString *quest;
@end
