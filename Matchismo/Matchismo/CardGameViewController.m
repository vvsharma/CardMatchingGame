//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) PlayingCardDeck *deck ;

// @property (nonatomic) NSString *selectedCardTitle ;

@end

@implementation CardGameViewController

- (void) setCardButtons:(NSArray *)cardButtons
{
    if (cardButtons)
        _cardButtons = cardButtons ;
    
    for (UIButton *cardButton in self.cardButtons)
    {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
//        [cardButton setImage:<#(UIImage *)#> forState:UIControlStateNormal] ;
        
    }
}

- (Deck *) deck {
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
        
    Card *card =[[self deck] drawRandomCard]    ;
        
        
    NSString *title = card.contents ;
    
    [sender setTitle:title forState:UIControlStateSelected ] ;
    
    }
    
    sender.selected = !sender.isSelected ;
    self.flipsCount++;
    
}



@end
