//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/31/13.
//
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"


@interface CardMatchingGame : NSObject

@property (readonly, nonatomic) int score ;
@property (readonly, nonatomic) NSString *flipMessage ;

- (void) flipCardAtIndex: (NSUInteger ) index ;

- (Card *) cardAtIndex: (NSUInteger) index ;


- (id) initWithCardCount:(NSUInteger) count
               usingdeck:(Deck *) deck ;

@end
