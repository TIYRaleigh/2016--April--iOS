//
//  TicketsTableViewController.m
//  Jackpot
//
//  Created by Ben Gohlke on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "WinningTicketViewController.h"

#import "Ticket.h"

@interface TicketsTableViewController ()
{
    NSMutableArray *tickets;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)createTicket:(id)sender;

@end

@implementation TicketsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Lottery Tickets";
    tickets = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [tickets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    Ticket *aTicket = tickets[indexPath.row];
    UILabel *numbersLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *payoutLabel = (UILabel *)[cell viewWithTag:2];
    
    numbersLabel.text = [aTicket description];
    if (aTicket.winner)
    {
        cell.backgroundColor = [UIColor greenColor];
        payoutLabel.text = aTicket.payout;
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
        payoutLabel.text = @"";
    }
    return cell;
}

#pragma mark - WinningTicketViewControllerDelegate

- (void)winningTicketWasAdded:(Ticket *)ticket
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self checkForWinnersUsingTicket:ticket];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowWinningTicketSegue"])
    {
        WinningTicketViewController *winningTicketVC = (WinningTicketViewController *)[segue destinationViewController];
        winningTicketVC.delegate = self;
    }
}

#pragma mark - Action Handlers

- (IBAction)createTicket:(id)sender
{
    Ticket *aTicket =[Ticket ticketUsingQuickPick];
    [tickets addObject:aTicket];
    [self.tableView reloadData];
}

#pragma mark - Private Methods

- (void)checkForWinnersUsingTicket:(Ticket *)winningTicket
{
    for (Ticket *aTicket in tickets)
    {
        [aTicket compareWithTicket:winningTicket];
    }
    [self.tableView reloadData];
}

@end
