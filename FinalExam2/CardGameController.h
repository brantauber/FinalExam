//
//  CardGameController.h
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface CardGameController : UIViewController

@property (nonatomic) CardMatchingGame *cardGame;
@property (nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
- (IBAction)flipCard:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
