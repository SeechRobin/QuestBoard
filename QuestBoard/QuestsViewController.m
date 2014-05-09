//
//  QuestsViewController.m
//  QuestBoard
//
//  Created by Robin Mukanganise on 2014/04/28.
//  Copyright (c) 2014 Robin. All rights reserved.
//

#import "QuestsViewController.h"
#import "DetailsViewController.h"

@interface QuestsViewController ()

@end

@implementation QuestsViewController
{
    NSMutableArray *quests;
    NSDictionary *questsDictionary;
    NSString *d;
    
}
//NSString *alignment= @"EVIL";

@synthesize myTableView;
@synthesize align;

NSString *alignment = @"NEUTRAL";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Prevent user from going back to login screen
    self.navigationItem.hidesBackButton = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questDetails" ofType:@"plist"];
    questsDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    quests = [NSMutableArray array];
    
    NSArray *details;
    
    for(id key in questsDictionary){
        details= [NSArray arrayWithArray:[questsDictionary objectForKey:key]];
        NSLog(@"%@", [details objectAtIndex:1]);
        if([alignment isEqualToString:@"NEUTRAL"])
        {
            [quests addObject:key];
        }
        if ([[details objectAtIndex:1]  isEqualToString:alignment] && ! [alignment isEqualToString:@"NEUTRAL"]){
            [quests addObject:key];
        }
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [quests count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
     cell.textLabel.text = [quests objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
//    ViewControllerB *viewControllerB = [[ViewControllerB alloc] initWithNib:@"ViewControllerB" bundle:nil];
//    viewControllerB.isSomethingEnabled = YES;
//    [self pushViewController:viewControllerB animated:YES];
//    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *cellText = selectedCell.textLabel.text;
//    //NSLog(@"%@", cellText);
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    DetailsViewController *obj=[storyboard instantiateViewControllerWithIdentifier:@"detailsView"];
//    obj.quest = cellText;
//    //NSLog(@"%@", cellText);
//    [obj setQuest: cellText];
    //self.navigationController.navigationBarHidden=NO;
    //[self.navigationController pushViewController:obj animated:YES];
    
//     DetailsViewController *detailsViewController = [[DetailsViewController alloc] initWithNibName:@"DetailsViewController" bundle:nil];
//    detailsViewController.quest = @"Pass";
//    [self pushViewController:detailsViewController animated:YES];
//    
     // ...
    
    
    //UITableViewController *detailController = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    //UITableViewCell *cell = [[self tableView] cellForRowAtIndexPath:indexPath];
    // detailController.title = cell.textLabel.text;
    
    //SearchViewController  *svc = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    //svc.title = cell.textLabel.text;
    
    
    // Pass the selected object to the new view controller.
    //[[self navigationController] pushViewController:detailController animated:YES];
}

- (void) setAlign:(NSString *)alignment
{
    alignment = align;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"goDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [[self tableView] cellForRowAtIndexPath:indexPath];
        [[segue destinationViewController] setQuest:cell.textLabel.text];
    }
}

@end
