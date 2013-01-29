//
//  PlayingCard.h
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit ;
@property (nonatomic) NSUInteger rank ;

+ (NSArray *) validSuits ;
+ (NSArray *) rankStrings ;
+ (NSUInteger ) maxRank ;

@end
