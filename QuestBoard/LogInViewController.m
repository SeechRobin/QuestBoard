//
//  LogInViewController.m
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/27.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "LogInViewController.h"
BOOL authenticated;
@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize username = _username;
@synthesize password = _password;
@synthesize loginButton = _loginButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)loginButtonPressed:(id)sender {
    //Using hard-coded username and password
    if([self.username.text  isEqual: @"Lancelot"]&& [self.password.text  isEqual: @"arthurDoesntKnow"]){
       authenticated = YES;
    }
    else
    {
       authenticated = YES;
    }
    
    if(authenticated)  //BOOL Value assign True only if Login Success
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        UITableViewController *obj=[storyboard instantiateViewControllerWithIdentifier:@"details"];
        self.navigationController.navigationBarHidden=NO;
        [self.navigationController pushViewController:obj animated:YES];
        [self.navigationItem setHidesBackButton:YES animated:YES];
        
    }
    else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
                                                            message:@"Please try again"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            alert = nil;
    }
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}


@end
