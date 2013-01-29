//
//  Card.h
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents ;

@property (nonatomic, getter = isUnPlayable ) BOOL unPlayable ;

@property (nonatomic, getter= isFaceUp) BOOL faceUp;

- (int) match:(NSArray *) otherCards ;


@end
