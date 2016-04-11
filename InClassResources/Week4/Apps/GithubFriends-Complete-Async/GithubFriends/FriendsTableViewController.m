//
//  FriendsTableViewController.m
//  GithubFriends
//
//  Created by Ben Gohlke on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "NewFriendViewController.h"
#import "FriendDetailViewController.h"

#import "FriendCell.h"

@interface FriendsTableViewController ()
{
    NSMutableArray *friends;
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Github Friends";
    
    friends = [[NSMutableArray alloc] init];
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"FriendCell"];
    
    UIBarButtonItem *addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    self.navigationItem.rightBarButtonItem = addFriendButton;
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
    return [friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    
    NSDictionary *friendInfo = friends[indexPath.row];
    cell.textLabel.text = [friendInfo objectForKey:@"name"];
    NSURL *avatarURL = [NSURL URLWithString:[friendInfo objectForKey:@"avatar_url"]];
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imageView.image = image;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriendDetailViewController *detailVC = [[FriendDetailViewController alloc] init];
    
    detailVC.friendInfo = friends[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

#pragma mark - Action Handlers

- (void)addFriend
{
    NewFriendViewController *newFriendVC = [[NewFriendViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newFriendVC];
    newFriendVC.view.backgroundColor = [UIColor purpleColor];
    newFriendVC.friends = friends;
    
    [self presentViewController:navController animated:YES completion:nil];
}

@end
