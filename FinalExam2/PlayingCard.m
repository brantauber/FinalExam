//
//  PlayingCard.m
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

+ (NSArray *) validSuits {
    return @[@"♥️",@"♣️",@"♠️",@"♦️"];
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [self.rankStrings count];
}

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

- (NSString *)suit {
    if (_suit)
        return _suit;
    else
        return @"?";
}

- (void)setRank:(NSUInteger) rank {
    if (_rank <= [PlayingCard maxRank])
        _rank = rank;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard  rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@end
