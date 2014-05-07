//
//  Card.h
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *content;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;

- (int)match:(Card *)givenCard;

@end
