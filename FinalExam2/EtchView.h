//
//  EtchView.h
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EtchView : UIView {
    NSMutableArray *points;
    CGPoint currentPoint;
}
@property (nonatomic) CGFloat currentVerticalAngle;
@property (nonatomic) CGFloat currentHorizontalAngle;
@property (nonatomic) CGFloat currentVelocity;
- (void) saveCurrentPoint;


@end
