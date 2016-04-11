//
//  FormValidator.m
//  Form Validator
//
//  Created by Ben Gohlke on 3/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator


- (BOOL)validateName:(NSString *)name
{
    BOOL rc = true;
    if ([[name componentsSeparatedByString:@" "] count] != 2)
    {
        rc = false;
    }
    
    return rc;
}

- (BOOL)validateAddress:(NSString *)streetAddress
{
    return [self validateWithDetectorType:NSTextCheckingTypeAddress onString:streetAddress];
}

- (BOOL)validateState:(NSString *)state
{
    BOOL rc = NO;
    if ([state length] == 2)
    {
        rc = YES;
    }
    return rc;
}

- (BOOL)validateZipCode:(NSString *)zipCode
{
    BOOL rc = NO;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if ([zipCode length] == 5 && [zipCode rangeOfCharacterFromSet:set].location != NSNotFound)
    {
        rc = YES;
    }
    
    return rc;
}

- (BOOL)validatePhone:(NSString *)phoneNumber
{
    return [self validateWithDetectorType:NSTextCheckingTypePhoneNumber onString:phoneNumber];
}

- (BOOL)validateWithDetectorType:(NSTextCheckingType)detectorType onString:(NSString *)string
{
    __block BOOL rc = NO;
    NSError *error = nil;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    [detector enumerateMatchesInString:string
                               options:kNilOptions
                                 range:NSMakeRange(0, [string length])
                            usingBlock:
     ^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
     {
         rc = YES;
     }];
    return rc;
}

@end