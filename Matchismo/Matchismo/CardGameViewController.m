//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Viswanathan Sharma on 1/28/13.
//
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;

@end

@implementation CardGameViewController

- (void) setFlipsCount:(int) flipsCount
{
    _flipsCount = flipsCount ;
    
    self.flipsLabel.text = [ NSString stringWithFormat:@"Flips : %d", self.flipsCount ] ;
}

- (IBAction)flipCard:(UIButton *)sender
{

    sender.selected = !sender.isSelected ;
    self.flipsCount++;

}


@end
