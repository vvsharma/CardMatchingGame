//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"


@implementation PlayingCardDeck

- (id) init
{

    // Initialize the deck by creating 52 cards.
    self = [super init] ;
    
    if (self)
    {
        // start here
        for ( NSString *suit in [PlayingCard validSuits] ) {
            
            for ( NSUInteger rank = 1; rank <= [PlayingCard maxRank] ; rank++ ) {
                
                // Set the card's suit and rank for each iteration 
                PlayingCard *card = [ [PlayingCard alloc ] init];
                card.suit = suit ;
                card.rank = rank ;
                
                [self addCard:card atTop:YES]; // add this card to the deck
            
            }              
        }
    }
return self;
}



               
               
@end
