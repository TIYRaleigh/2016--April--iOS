//
//  TipsTableViewController.m
//  IronTips
//
//  Created by Ben Gohlke on 4/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TipsTableViewController.h"
#import "TipCell.h"

#import <Parse/Parse.h>

@interface TipsTableViewController ()

@end

@implementation TipsTableViewController
{
    NSArray *tips;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTip:)];
}

- (void)viewWillAppear:(BOOL)animated
{
//    [self refreshTips:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser])
    {
        [self performSegueWithIdentifier:@"ShowLoginModalSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [tips count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    
    PFObject *aTip = tips[indexPath.row];
//    PFRelation *createdByRelation = aTip[@"createdBy"];
    cell.commentTextView.text = aTip[@"comment"];
    
    return cell;
}

#pragma mark - Action Handlers

- (IBAction)addTip:(UIBarButtonItem *)sender
{
    PFObject *aNewTip = [PFObject objectWithClassName:@"Tip"];
    
}

- (IBAction)refreshTips:(UIBarButtonItem *)sender
{
    if ([PFUser currentUser])
    {
        PFQuery *query = [[PFQuery alloc] initWithClassName:@"Tip"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                tips = objects;
            }
        }];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)unwindToTipsTableViewController:(UIStoryboardSegue *)unwindSegue
{
    if ([PFUser currentUser])
    {
        if ([PFUser currentUser])
        {
            PFQuery *query = [[PFQuery alloc] initWithClassName:@"Tip"];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error)
                {
                    tips = objects;
                }
            }];
        }
    }
}

@end
