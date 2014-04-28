//
//  LogInViewController.h
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/27.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "ViewController.h"

@interface LogInViewController : ViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)loginButtonPressed:(id)sender;
-(IBAction)textFieldReturn:(id)sender;

@end
