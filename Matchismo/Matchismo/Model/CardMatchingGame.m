//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/31/13.
//
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()

@property (nonatomic, readwrite) int score ; // it is readwrite for private but read only for the public

@property (nonatomic, strong) NSMutableArray *cards; // of cards

@end

@implementation CardMatchingGame


- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[ NSMutableArray alloc] init];
    return _cards ;
}

// must call : this is the designated initializer
- (id) initWithCardCount:(NSUInteger) count  usingdeck:(Deck *) deck
{
    self = [super init];  // Must call super's designated initializer
                          // this s a rule
    
    if (self)
    {
        // draw out/count cards
        for (int i=0; i<count ; i++)
        {
            
            Card *card = [deck drawRandomCard];
            
            if (card) {
                self.cards [i] = card ;
            }
            else
            {
                // if we do not have card because somebody specified
                // count = more than the cards we have initialized in the deck 
                self = nil ;
                break ; // out of the for loop
            }
    
        }        
    }

    return self ;
}

- (int) score
{
    // getter for score
    return _score ;
    
}

#define MATCH_BONUS      4    // Bonus for finding he right matchng card
#define MISMATCH_PENALTY 2    // penalty if the cards don't match
#define FLIP_COST 1 // cost of flipping too much


- (void) flipCardAtIndex: (NSUInteger ) index
{
    // this does the matching as well
    
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.unPlayable)  {
        if (!card.isFaceUp) {        
            for (Card *otherCard in self.cards)
            {
             if (otherCard.isFaceUp && !otherCard.isUnPlayable)
             {
                int matchScore  = [card match:@[otherCard]] ; //this array initialization only works in >=iOS6
                if (matchScore) {                    
                    card.unPlayable = YES;
                    otherCard.unPlayable = YES;
                    self.score += matchScore * MATCH_BONUS ;
                }
                else {
                    otherCard.faceUp = NO; // no match. So turn the card face down
                    self.score -= MISMATCH_PENALTY ;
                }// else
                 break ; // out of for
             }//if
            }//for
          self.score -= FLIP_COST ;        
        } // if
        card.FaceUp = !card.isFaceUp ;
        
    }//if
    
}

- (Card *) cardAtIndex: (NSUInteger) index
{
    return (index < [self.cards count]) ? self.cards[index] : nil ;
}





@end
