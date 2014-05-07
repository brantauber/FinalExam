//
//  PlayingCardDeck.m
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
- (id)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger i =1; i<[PlayingCard maxRank] ; i++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = i;
                card.suit = suit;
                card.content = [card contents];
                [self addCard:card];
            }
        }
    }
    return self;
}
@end
