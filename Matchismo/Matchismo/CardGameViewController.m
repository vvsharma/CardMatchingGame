//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"



@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;

@property (strong, nonatomic) PlayingCardDeck *deck ;

// @property (nonatomic) NSString *selectedCardTitle ;

@end

@implementation CardGameViewController


- (PlayingCardDeck *) deck {
    // Just initalize when needed if not already done.
    if (!_deck)
        _deck = [[PlayingCardDeck alloc] init];
    
    return _deck ;
    
}

- (void) setFlipsCount:(int) flipsCount
{

    _flipsCount = flipsCount ;

    self.flipsLabel.text = [ NSString stringWithFormat:@"Flips : %d", self.flipsCount ] ;
    
}

- (IBAction)flipCard:(UIButton *)sender
{

    if (!sender.selected ) {
        
    PlayingCard *card = (PlayingCard *)[[self deck] drawRandomCard]    ;

    NSString *title = [ [PlayingCard rankStrings][card.rank] stringByAppendingString: [card suit] ] ;
    
    [sender setTitle:title forState:UIControlStateSelected ] ;
    
    }
    
    sender.selected = !sender.isSelected ;
    self.flipsCount++;
    
}



@end
