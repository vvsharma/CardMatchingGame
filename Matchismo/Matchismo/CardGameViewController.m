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
- (IBAction)dealButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextField *flipMessageLabel;

@property (strong, nonatomic) CardMatchingGame *game ;



@end

@implementation CardGameViewController
@synthesize game = _game;

- (void) setGame : (CardMatchingGame *) newGame ;
{
    _game = newGame ;
    
}


- (CardMatchingGame *) game
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
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    // update flip message
    self.flipMessageLabel.text = [NSString stringWithFormat:@"%@", self.game.flipMessage ];
    
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



- (IBAction)dealButton:(UIButton *)sender {
    
    
    CardMatchingGame *newGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingdeck:[[PlayingCardDeck alloc] init]];
    
    self.game = newGame ;
    
    [self updateUI]; 
    
    
}
@end
