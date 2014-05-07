//
//  SpiroViewController.h
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiroViewController : UIViewController
- (IBAction)redraw:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *kslider;
@property (weak, nonatomic) IBOutlet UISlider *lslider;
@property (weak, nonatomic) IBOutlet UITextField *numStepsText;
@property (weak, nonatomic) IBOutlet UITextField *stepSizeText;

@end
