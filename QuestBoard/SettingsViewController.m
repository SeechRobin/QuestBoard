//
//  SettingsViewController.m
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/05/08.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "SettingsViewController.h"
#import "QuestsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
NSString *alignment;
@synthesize segmentedControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)segmentedControlIndexChanged:(id)sender {
    alignment = [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"goSettings"]){
        [[segue destinationViewController] setAlign:alignment];
    }
}


@end
