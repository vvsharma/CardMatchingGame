//
//  Deck.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic) NSMutableArray *cards ; // of Card type

@end

@implementation Deck


- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init] ;
    
    return _cards ;
}





- (void) addCard:(Card *)card atTop:(BOOL) atTop {
    
    if (card) {
        if (atTop) {
            [ self.cards insertObject:card atIndex:0 ];
        }
        else {
            [self.cards addObject:card ];
        }
    }
    
    
}



- (Card *) drawRandomCard {
    Card *randomcard = nil ;
    
    if (self.cards.count)
    {
        unsigned index = arc4random() % self.cards.count ;
        
        randomcard = self.cards [index];
        [[self cards] removeObjectAtIndex:index ];
        
    }
    
    
    return randomcard ; 
}

@end
