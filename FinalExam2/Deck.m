//
//  Deck.m
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "Deck.h"
@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *) cards {
    if (! _cards) {
        _cards =[[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop)
        [self.cards insertObject:card atIndex:0];
    else
        [self.cards addObject:card];
}

-(Card *)drawRandomCard {
    Card *p = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % self.cards.count;
        p = [self.cards objectAtIndex:index];
        [self.cards removeObject:p];
    }
    return p;
}

@end
