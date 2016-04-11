//
//  TodoListTableViewController.m
//  In Due Time
//
//  Created by Ben Gohlke on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TodoListTableViewController.h"

#import "TodoTableViewCell.h"

#import "TodoItem.h"

@interface TodoListTableViewController () <UITextFieldDelegate>
{
    NSMutableArray *todoItems;
    UIRefreshControl *refreshControl;
}

- (IBAction)addTodoItem:(UIBarButtonItem *)sender;
- (IBAction)clearCompleteTodos:(UIRefreshControl *)sender;
- (IBAction)checkmarkTapped:(UIButton *)sender;

@end

@implementation TodoListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Todo";
    
    todoItems = [[NSMutableArray alloc] init];
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(clearCompleteTodos:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTodoItem:)];
}

- (void)didReceiveMemoryWarning
{
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
    return [todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoItemCell" forIndexPath:indexPath];
    
    TodoItem *todoItem = todoItems[indexPath.row];
    
    // Reset textfield/button values in case of cell reuse
    cell.descriptionTextField.text = @"";
    
    if (todoItem.title)
    {
        cell.descriptionTextField.text = todoItem.title;
    }
    else
    {
        [cell.descriptionTextField becomeFirstResponder];
    }
    
    [cell.checkBoxButton setSelected:todoItem.done];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoItem *item = todoItems[indexPath.row];
    return item.done;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [todoItems removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        [textField resignFirstResponder];
        rc = YES;
        
        UIView *contentView = [textField superview];
        UITableViewCell *cell = (UITableViewCell *)[contentView superview];
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        TodoItem *anItem = todoItems[path.row];
        anItem.title = textField.text;
    }
    
    return rc;
}

#pragma mark - Action Handlers

- (IBAction)addTodoItem:(UIBarButtonItem *)sender
{
    TodoItem *aNewItem = [[TodoItem alloc] init];
    [todoItems addObject:aNewItem];
        
    NSUInteger row = [todoItems indexOfObject:aNewItem];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)clearCompleteTodos:(UIRefreshControl *)sender
{
    NSMutableArray *indexPathsToRemove = [[NSMutableArray alloc] init];
    NSMutableArray *itemsToRemove = [[NSMutableArray alloc] init];
    
    for (TodoItem *anItem in todoItems)
    {
        if (anItem.done)
        {
            [itemsToRemove addObject:anItem];
            [indexPathsToRemove addObject:[NSIndexPath indexPathForRow:[todoItems indexOfObject:anItem] inSection:0]];
        }
    }
    
    [todoItems removeObjectsInArray:itemsToRemove];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToRemove withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [sender endRefreshing];
}

- (IBAction)checkmarkTapped:(UIButton *)sender
{
    UIView *contentView = [sender superview];
    UITableViewCell *cell = (UITableViewCell *)[contentView superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    TodoItem *anItem = todoItems[path.row];
    anItem.done = !anItem.done;
    [sender setSelected:anItem.done];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
