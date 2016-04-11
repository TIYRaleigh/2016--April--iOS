//
//  SecondViewController.m
//  Timer
//
//  Created by Ben Gohlke on 2/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSInteger startingValue;
    NSInteger currentValue;
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

- (IBAction)startTapped:(id)sender;
- (IBAction)stopTapped:(id)sender;
- (IBAction)resetTapped:(id)sender;
- (IBAction)stepperValueChanged:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    startingValue = 60;
    currentValue = 60;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startTimer
{
    if (!timer)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(processStep)
                                               userInfo:nil
                                                repeats:YES];
    }
}

- (void)stopTimer
{
    if (timer)
    {
        [timer invalidate];
        timer = nil;
    }
}

- (void)updateLabel
{
    self.timerLabel.text = [NSString stringWithFormat:@"%ld seconds", (long)currentValue];
}

- (void)processStep
{
    if (currentValue > 0)
    {
        currentValue--;
        [self updateLabel];
    }
    else
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

#pragma mark - Action Handlers

- (IBAction)startTapped:(id)sender
{
    [self startTimer];
}

- (IBAction)stopTapped:(id)sender
{
    [self stopTimer];
}

- (IBAction)resetTapped:(id)sender
{
    [self stopTimer];
    currentValue = startingValue;
    [self updateLabel];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)stepperValueChanged:(id)sender
{
    if (!timer)
    {
        startingValue = self.stepper.value;
    }
}

@end
