//
//  ViewController.m
//  Form Validator
//
//  Created by Ben Gohlke on 3/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () <UITextFieldDelegate>
{
    FormValidator *validator;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Validator";
    validator = [[FormValidator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    UITextField *nextTextField = nil;
    
    if (![textField.text isEqualToString:@""])
    {
        if (textField == self.nameTextField)
        {
            rc = [validator validateName:textField.text];
            nextTextField = self.addressTextField;
        }
        else if (textField == self.addressTextField)
        {
            rc = [validator validateAddress:textField.text];
            nextTextField = self.cityTextField;
        }
        else if (textField == self.cityTextField)
        {
            rc = YES;
            nextTextField = self.stateTextField;
        }
        else if (textField == self.stateTextField)
        {
            rc = [validator validateState:textField.text];
            nextTextField = self.zipCodeTextField;
        }
        else if (textField == self.zipCodeTextField)
        {
            rc = [validator validateZipCode:textField.text];
            nextTextField = self.phoneNumberTextField;
        }
        else if (textField == self.phoneNumberTextField)
        {
            rc = [validator validatePhone:textField.text];
        }
        
        if (rc)
        {
            [textField resignFirstResponder];
            if (nextTextField)
            {
                [nextTextField becomeFirstResponder];
            }
        }
    }
    
    return rc;
}

@end