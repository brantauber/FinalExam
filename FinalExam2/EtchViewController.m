//
//  EtchViewController.m
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "EtchViewController.h"

@interface EtchViewController ()

@end

@implementation EtchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lastVelocity = 0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addVertical:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f velocity",s.velocity);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.etchView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.etchView saveCurrentPoint];
    }
    [self.etchView setCurrentVerticalAngle:s.rotation];
    [self.etchView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.etchView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (IBAction)addHorizontal:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal",s.rotation);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.etchView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.etchView saveCurrentPoint];
    }
    [self.etchView setCurrentHorizontalAngle:s.rotation];
    [self.etchView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.etchView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}
@end
