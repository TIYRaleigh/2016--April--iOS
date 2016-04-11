//
//  ViewController.m
//  FirstApp
//
//  Created by Ben Gohlke on 2/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UISwitch *colorSwitch;

- (IBAction)buttonTapped:(id)sender;
- (IBAction)switchValueChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.button setTitle:@"Go" forState:UIControlStateNormal];
    [self.colorSwitch setOn:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Handlers

- (IBAction)buttonTapped:(id)sender
{
    if (![self.nameTextField.text isEqualToString:@""])
    {
        NSArray *nameParts = [self.nameTextField.text componentsSeparatedByString:@" "];
        NSString *firstName = nameParts[0];
        NSString *message = [NSString stringWithFormat:@"Hello, %@!", firstName];
        self.messageLabel.text = message;
    }
    else
    {
        self.messageLabel.text = @"Hello World!";
    }
}

- (IBAction)switchValueChanged:(id)sender
{
    if (self.colorSwitch.on)
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end
