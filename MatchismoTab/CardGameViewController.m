//
//  CardGameViewController.m
//  Machismo
//
//  Created by Chong Lian on 4/3/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) GameResult *gameResult;
@end


@implementation CardGameViewController

- (GameResult *) gameResult {
    if (!_gameResult) {
        _gameResult = [[GameResult alloc] init];
    }
    return _gameResult;
}

- (CardMatchingGame *) game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable? 0.3 : 1.0);
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)deal {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount ++;
    [self updateUI];
    //NSLog(@"%lu", (unsigned long)[self.cardButtons count]);
    self.gameResult.score = self.game.score;
}

@end
