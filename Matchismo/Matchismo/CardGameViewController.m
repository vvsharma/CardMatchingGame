//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame *game ;

// @property (nonatomic) NSString *selectedCardTitle ;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) // do this the first time only
    {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingdeck:[[PlayingCardDeck alloc] init]];
        
    }
    return _game ;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
 
    _cardButtons = cardButtons ;
    [self updateUI] ;
    

}

- (void) updateUI {

    // make sure the UI match the model and vice versa
    for ( UIButton *cardButton in self.cardButtons) {
        
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        
        [cardButton setTitle:card.contents
                    forState:UIControlStateSelected|UIControlStateDisabled ];
        
        cardButton.selected = card.isFaceUp ;
        
        cardButton.enabled = !card.isUnPlayable ;
        
        cardButton.alpha = ( card.isUnPlayable ? 0.3 : 1.0 );
    }
    
    
}


- (void) setFlipsCount:(int) flipsCount
{

    _flipsCount = flipsCount ;

    self.flipsLabel.text = [ NSString stringWithFormat:@"Flips : %d", self.flipsCount ] ;
    
}

- (IBAction)flipCard:(UIButton *)sender
{

    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    
    self.flipsCount++;
    [self updateUI] ;
}



@end
