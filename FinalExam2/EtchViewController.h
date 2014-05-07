//
//  EtchViewController.h
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EtchView.h"

@interface EtchViewController : UIViewController {
    CGFloat lastVelocity;
}

@property (weak, nonatomic) IBOutlet EtchView *etchView;
- (IBAction)addVertical:(id)sender;
- (IBAction)addHorizontal:(id)sender;

@end
