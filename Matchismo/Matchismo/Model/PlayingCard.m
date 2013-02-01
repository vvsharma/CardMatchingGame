//
//  PlayingCard.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "PlayingCard.h"


@implementation PlayingCard 

@synthesize suit = _suit;
//@synthesize rank = _rank ;

- (int) match: (NSArray *)otherCards {
    // The cards are never going to match with a single deck
    
    int score = 0 ;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit])
        {
            score = 1  ;
        } //if
        else if ( otherCard.rank == self.rank) {
            // rarer to match rank than suits so higher score ;
            score = 4;
        } //else-if
    }//if
    return score ;
}//eom

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit ];
    
}

- (void) setSuit : (NSString *) suit
{
    // we use the class method of the PlayingCard class.
    
    if (  [[PlayingCard validSuits] containsObject:suit ] )
    {

        _suit = suit ;

    }
    
}


- (NSString *) suit
{
    
    return _suit ? _suit : @"?" ;
    
}


- (void) setRank:(NSUInteger)rank
{
    if ( rank <= [PlayingCard maxRank])
        _rank = rank ;
}


+ (NSArray *) validSuits
{
    return @[@"♠", @"♣", @"♥" , @"♦"]  ;
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    
}

+ (NSUInteger ) maxRank
{
    return [self rankStrings].count - 1 ;
}
@end
