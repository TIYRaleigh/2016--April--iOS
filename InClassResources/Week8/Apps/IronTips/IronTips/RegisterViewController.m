//
//  RegisterViewController.m
//  IronTips
//
//  Created by Ben Gohlke on 4/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;

- (IBAction)signUpTapped:(UIButton *)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
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

- (IBAction)signUpTapped:(UIButton *)sender
{
    if ([self userCanSignIn])
    {
        PFUser *user = [PFUser user];
        user.username = self.usernameTextField.text;
        user.password = self.passcodeTextField.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
            {
                [self performSegueWithIdentifier:@"UnwindFromRegisterSegue" sender:self];
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
