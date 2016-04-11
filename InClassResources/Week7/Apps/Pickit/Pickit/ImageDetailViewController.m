//
//  ImageDetailViewController.m
//  Pickit
//
//  Created by Ben Gohlke on 4/6/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ImageDetailViewController.h"

@implementation ImageDetailViewController
{
    UIImageView *_imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = self.image;
    [self.view addSubview:_imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
