//
//  QuestsViewController.h
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
//@property (strong, nonatomic) IBOutlet UILabel *questNameLabel;

@property (nonatomic, strong) UITableView *myTableView;

@end
