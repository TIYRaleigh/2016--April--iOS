//
//  FormValidator.h
//  Form Validator
//
//  Created by Ben Gohlke on 3/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

- (BOOL)validateName:(NSString *)name;
- (BOOL)validateAddress:(NSString *)streetAddress;
- (BOOL)validateState:(NSString *)state;
- (BOOL)validateZipCode:(NSString *)zipCode;
- (BOOL)validatePhone:(NSString *)phoneNumber;

@end