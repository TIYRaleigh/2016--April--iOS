//
//  StudentsTableViewController.m
//  TIY
//
//  Created by Ben Gohlke on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "StudentsTableViewController.h"
#import "StudentCell.h"
#import "Student.h"

#import "CoreDataStack.h"

static NSString * const StudentCellIdentifier = @"StudentCell";

@interface StudentsTableViewController () <UITextFieldDelegate>
{
    NSMutableArray *students;
    CoreDataStack *cdStack;
}

- (IBAction)addNewStudent:(UIBarButtonItem *)sender;

@end

@implementation StudentsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.tableView registerClass:[StudentCell class] forCellReuseIdentifier:StudentCellIdentifier];
    cdStack = [CoreDataStack coreDataStackWithModelName:@"TIYModel"];
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
    
    students = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:cdStack.managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    fetch.entity = entity;
    
    students = nil;
    students = [[cdStack.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
    [self.tableView reloadData];
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
    return [students count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:StudentCellIdentifier forIndexPath:indexPath];
    
    Student *aStudent = students[indexPath.row];
    if ([aStudent.lastName isEqualToString:@""])
    {
        [cell.nameTextField becomeFirstResponder];
    }
    else
    {
        [cell.nameTextField setText:aStudent.lastName];
    }
    
//    if (aStudent.ageValue == 0)
//    {
//        [cell.ageTextField becomeFirstResponder];
//    }
//    else
//    {
//        [cell.ageTextField setText:[NSString stringWithFormat:@"%d", aStudent.ageValue]];
//    }
    
    return cell;
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    UIView *contentView = [textField superview];
    StudentCell *cell = (StudentCell *)[contentView superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Student *aStudent = students[indexPath.row];
    
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        if ([textField.placeholder isEqualToString:@"age"])
        {
            [cell.nameTextField becomeFirstResponder];
        }
        else
        {
            aStudent.lastName = textField.text;
            aStudent.ageValue = 0;
            [textField resignFirstResponder];
            [self saveCoreDataUpdates];
        }
    }
    
    return rc;
}

#pragma mark - Action Handlers

- (IBAction)addNewStudent:(UIBarButtonItem *)sender
{
    Student *aStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:cdStack.managedObjectContext];
    [students addObject:aStudent];
    NSInteger index = [students indexOfObject:aStudent];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Private methods

- (void)saveCoreDataUpdates
{
    [cdStack saveOrFail:^(NSError *errorOrNil)
    {
        if (errorOrNil)
        {
            NSLog(@"Error from CDStack: %@", [errorOrNil localizedDescription]);
        }
    }];
}


@end


























