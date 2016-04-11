//
//  TodoTableViewCell.h
//  In Due Time
//
//  Created by Ben Gohlke on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end
