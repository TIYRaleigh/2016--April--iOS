//
//  ViewController.m
//  IronTips
//
//  Created by Ben Gohlke on 4/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;

- (IBAction)signInTapped:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    BOOL rc = [self userCanSignIn];
    
    if (!rc && ![textField.text isEqualToString:@""])
    {
        if (textField == self.usernameTextField)
        {
            [self.passcodeTextField becomeFirstResponder];
        }
        else
        {
            [self.usernameTextField becomeFirstResponder];
        }
    }
    
    return rc;
}

- (BOOL)userCanSignIn
{
    if (![self.usernameTextField.text isEqualToString:@""] && ![self.passcodeTextField.text isEqualToString:@""])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (IBAction)signInTapped:(UIButton *)sender
{
    if ([self userCanSignIn])
    {
        [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passcodeTextField.text block:^(PFUser *user, NSError *error) {
            if (user)
            {
                [self performSegueWithIdentifier:@"UnwindFromLoginSegue" sender:self];
            }
            else
            {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"Error" message:[error userInfo][@"error"] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertC addAction:alertAction];
                [self presentViewController:alertC animated:YES completion:nil];
            }
        }];
    }
}

@end
