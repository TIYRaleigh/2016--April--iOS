//
//  FriendDetailViewController.m
//  GithubFriends
//
//  Created by Ben Gohlke on 3/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController () <UITableViewDelegate, UITableViewDataSource, NSURLSessionDataDelegate>
{
    NSArray * repos;
    NSMutableData *receivedData;
    
    UITableView *theTableView;
}

@end

@implementation FriendDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *username = self.friendInfo[@"login"];
    self.title = self.friendInfo[@"name"];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"%@",urlString);
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
//    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
//    NSLog(@"%@",repos);
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    [dataTask resume];
    
    theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    theTableView.delegate = self;
    theTableView.dataSource = self;
    
    [self.view addSubview:theTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    NSDictionary *repo = repos[indexPath.row];
    
    cell.textLabel.text = repo[@"name"];
    
    if (repos[indexPath.row][@"description"] != [NSNull null])
    {
        cell.detailTextLabel.text = repos[indexPath.row][@"description"];
    }
    
    return cell;
}

#pragma mark - NSURLSessionData delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [receivedData appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful.");
        repos = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        [theTableView reloadData];
    }
}

@end