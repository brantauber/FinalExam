//
//  Card.m
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(Card *)givenCard {
    if ([[givenCard.content substringToIndex:givenCard.content.length - 2] isEqualToString:[self.content substringToIndex:self.content.length - 2]])
        return 1;
    else if ([[givenCard.content substringFromIndex:givenCard.content.length - 2] isEqualToString:[self.content substringFromIndex:self.content.length - 2]])
        return 2;
    else
        return 0;
}

@end
