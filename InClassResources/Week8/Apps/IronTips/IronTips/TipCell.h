//
//  TipCell.h
//  IronTips
//
//  Created by Ben Gohlke on 4/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@end
