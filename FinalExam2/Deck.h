//
//  Deck.h
//  Practice_1
//
//  Created by Brandon on 2/16/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *) card;
- (void)addCard:(Card *) card
          atTop:(BOOL) atTop;
- (Card *)drawRandomCard;

@end
