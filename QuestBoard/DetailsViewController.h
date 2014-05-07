//
//  DetailsViewController.h
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "ViewController.h"

@interface DetailsViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *questNameTextLabel;
@property (strong, nonatomic) IBOutlet UITextView *questDetailsView;
//@property (strong, nonatomic) NSString  *quest;
@property(nonatomic) NSString *quest;
@end
