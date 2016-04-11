//
//  StudentCell.h
//  TIY
//
//  Created by Ben Gohlke on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;

@end
