//
//  VoltageCalculatorTableViewController.m
//  High Voltage
//
//  Created by Ben Gohlke on 3/10/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "VoltageCalculatorTableViewController.h"
#import "ValueTypesTableViewController.h"

#import "ElectricityConversions.h"

@interface VoltageCalculatorTableViewController () <UITextFieldDelegate, UIPopoverPresentationControllerDelegate>
{
    UITextField *currentTextField;
    UITextField *resistanceTextField;
    UITextField *voltsTextField;
    UITextField *powerTextField;
    
    ElectricityConversions *converter;
    
    NSMutableArray *tableData;
    NSMutableDictionary *valueTypes;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addValueTypeBarButtonItem;

- (IBAction)clearTransaction:(UIBarButtonItem *)sender;

@end

@implementation VoltageCalculatorTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableData = [[NSMutableArray alloc] init];
    valueTypes = [[NSMutableDictionary alloc] initWithObjects:@[@"CurrentCell", @"ResistanceCell", @"VoltsCell", @"PowerCell"] forKeys:@[@"Amps", @"Ohms", @"Volts", @"Watts"]];
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
    return [tableData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    
    if ([tableData count] > 0)
    {
        title = @"Enter two values";
    }
    else
    {
        title = @"";
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [tableData objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    UITextField *textField = (UITextField *)[cell viewWithTag:1];
    textField.text = @"";
    [textField setUserInteractionEnabled:!converter.allValuesFound];
    
    if ([identifier isEqualToString:@"CurrentCell"])
    {
        currentTextField = textField;
        if (converter.ampsString)
        {
            [textField setText:converter.ampsString];
        }
    }
    else if ([identifier isEqualToString:@"ResistanceCell"])
    {
        resistanceTextField = textField;
        if (converter.ohmsString)
        {
            [textField setText:converter.ohmsString];
        }
    }
    else if ([identifier isEqualToString:@"VoltsCell"])
    {
        voltsTextField = textField;
        if (converter.voltsString)
        {
            [textField setText:converter.voltsString];
        }
    }
    else if ([identifier isEqualToString:@"PowerCell"])
    {
        powerTextField = textField;
        if (converter.wattsString)
        {
            [textField setText:converter.wattsString];
        }
    }
    
    NSString *key = [valueTypes allKeysForObject:identifier][0];
    [valueTypes removeObjectForKey:key];
    
    [textField becomeFirstResponder];
    
    return cell;
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        if (textField == currentTextField)
        {
            converter.ampsString = textField.text;
        }
        else if (textField == resistanceTextField)
        {
            converter.ohmsString = textField.text;
        }
        else if (textField == voltsTextField)
        {
            converter.voltsString = textField.text;
        }
        else if (textField == powerTextField)
        {
            converter.wattsString = textField.text;
        }
    }
    
    if (rc)
    {
        [textField resignFirstResponder];
    }
    
    [converter findOtherValuesIfPossible];
    
    return rc;
}

#pragma mark - ValuesTypeViewController delegate

- (void)valueTypeWasChosen:(NSString *)chosenValueType
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    if (!converter)
    {
        converter = [[ElectricityConversions alloc] init];
        converter.delegate = self;
    }
    
    NSString *cellIdentifier = valueTypes[chosenValueType];
    [tableData addObject:cellIdentifier];
    if ([tableData count] == 2)
    {
        [self.addValueTypeBarButtonItem setEnabled:NO];
    }
    
    NSUInteger row = [tableData indexOfObject:cellIdentifier];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - ElectricityConversions delegate

- (void)valuesWereCalculated
{
    [self resetValueTypesDictionary];
    
    if (!voltsTextField)
    {
        NSString *cellIdentifier = valueTypes[@"Volts"];
        [tableData addObject:cellIdentifier];
    }
    if (!currentTextField)
    {
        NSString *cellIdentifier = valueTypes[@"Amps"];
        [tableData addObject:cellIdentifier];
    }
    if (!resistanceTextField)
    {
        NSString *cellIdentifier = valueTypes[@"Ohms"];
        [tableData addObject:cellIdentifier];
    }
    if (!powerTextField)
    {
        NSString *cellIdentifier = valueTypes[@"Watts"];
        [tableData addObject:cellIdentifier];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Action Handlers

- (IBAction)clearTransaction:(UIBarButtonItem *)sender
{
    [tableData removeAllObjects];
    [self.addValueTypeBarButtonItem setEnabled:YES];
    converter = nil;
    [self resetValueTypesDictionary];
    [self.tableView reloadData];
}

#pragma mark - Navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowValueTypePopoverSegue"])
    {
        ValueTypesTableViewController *valueTypesVC = (ValueTypesTableViewController *)[segue destinationViewController];
        valueTypesVC.delegate = self;
        valueTypesVC.popoverPresentationController.delegate = self;
        float contentHeight = 44.0f * [valueTypes count];
        valueTypesVC.preferredContentSize = CGSizeMake(100.0f, contentHeight);
        valueTypesVC.valueTypes = [valueTypes allKeys];
    }
}

#pragma mark - Private methods

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

- (void)resetValueTypesDictionary
{
    [valueTypes removeAllObjects];
    [valueTypes addEntriesFromDictionary:@{@"Amps": @"CurrentCell", @"Ohms": @"ResistanceCell", @"Volts": @"VoltsCell", @"Watts": @"PowerCell"}];
}
 

@end
