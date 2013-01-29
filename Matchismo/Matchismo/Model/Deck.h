//
//  Deck.h
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//



#import <Foundation/Foundation.h>
#import "Card.h"



@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL) atTop ;

- (Card *) drawRandomCard ;

@end
