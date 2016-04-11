//
//  TodoTableViewController.m
//  Todo
//
//  Created by Ben Gohlke on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TodoTableViewController.h"
#import "PriorityTableViewController.h"

#import "TodoItem.h"

@interface TodoTableViewController () <UITextFieldDelegate, UIPopoverPresentationControllerDelegate>
{
    NSMutableArray *taskList;
}

- (IBAction)addTodoItem:(UIBarButtonItem *)sender;

@end

@implementation TodoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    taskList = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [taskList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    
    TodoItem *item = taskList[indexPath.row];
    UITextField *textField = (UITextField *)[cell viewWithTag:1];
    UILabel *priorityLabel = (UILabel *)[cell viewWithTag:2];
    
    textField.delegate = self;
    
    if (item)
    {
        if (item.taskName)
        {
            [textField setText:item.taskName];
        }
        else
        {
            [textField becomeFirstResponder];
        }
        priorityLabel.text = [item priorityAsString];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowPriorityPopoverSegue"])
    {
        PriorityTableViewController *destVC = (PriorityTableViewController *)[segue destinationViewController];
        destVC.popoverPresentationController.delegate = self;
        NSArray *priorityTypes = [TodoItem allPriorityTypes];
        float contentHeight = 44.0f * [priorityTypes count];
        destVC.preferredContentSize = CGSizeMake(100.0f, contentHeight);
    }
}

#pragma mark - PopoverPresentationController delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        [textField resignFirstResponder];
        
        UIView *contentView = [textField superview];
        UITableViewCell *cell = (UITableViewCell *)[contentView superview];
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        TodoItem *anItem = taskList[path.row];
        anItem.taskName = textField.text;
        
        rc = YES;
    }
    
    return rc;
}

#pragma mark - Action Handlers

- (IBAction)addTodoItem:(UIBarButtonItem *)sender
{
    TodoItem *anItem = [[TodoItem alloc] init];
    [taskList addObject:anItem];
    [self.tableView reloadData];
}

@end
