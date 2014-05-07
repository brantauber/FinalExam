//
//  CardMatchingGame.m
//  Card Match
//
//  Created by Brandon on 2/27/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;

@end
@implementation CardMatchingGame

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    self.cards = [[NSMutableArray alloc] init];
    if (self) {
        for (int i = 0; i < count; i++){
            Card *p = [deck drawRandomCard];
            [self.cards addObject:p];
        }
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *p = [self cardAtIndex:index];
    if (p.chosen)
        p.chosen = NO;
    else {
        p.chosen = YES;
        self.score -= 1;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return [self.cards objectAtIndex:index];
}

- (void)suitMatch {
    self.score += 4;
}

- (void)rankMatch {
    self.score += 16;
}
@end
