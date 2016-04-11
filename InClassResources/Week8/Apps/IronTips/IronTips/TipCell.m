//
//  TipCell.m
//  IronTips
//
//  Created by Ben Gohlke on 4/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TipCell.h"

@implementation TipCell

- (void)awakeFromNib
{
    self.userLabel.text = @"";
    self.commentTextView.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
