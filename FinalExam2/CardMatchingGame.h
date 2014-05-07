//
//  CardMatchingGame.h
//  Card Match
//
//  Created by Brandon on 2/27/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"

@interface CardMatchingGame : NSObject
- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)suitMatch;
- (void)rankMatch;

@property (nonatomic, readonly)NSInteger score;
@property (nonatomic)NSMutableArray *cards;
@end
