//
//  Deck.h
//  Machismo
//
//  Created by Chong Lian on 4/3/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
