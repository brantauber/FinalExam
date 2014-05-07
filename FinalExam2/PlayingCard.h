//
//  PlayingCard.h
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
- (NSString *)contents;
@end
