//
//  SettingsViewController.h
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/05/08.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "ViewController.h"

@interface SettingsViewController : ViewController
{
    UISegmentedControl *segmentedControl;
}

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

-(IBAction)segmentedControlIndexChanged;
@end
