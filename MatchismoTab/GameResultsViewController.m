//
//  GameResultsViewController.m
//  MatchismoTab
//
//  Created by Chong Lian on 4/4/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResult.h"

@interface GameResultsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@property (nonatomic) SEL sortSelector;
@end
 
@implementation GameResultsViewController


- (void)updateUI {
    NSString *displayText = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    for (GameResult *result in [[GameResult allGameResults] sortedArrayUsingSelector:self.sortSelector]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g)\n", result.score, [formatter stringFromDate:result.end], round(result.duration)];
    }
    self.display.text = displayText;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}



@synthesize sortSelector = _sortSelector;

- (SEL)sortSelector {
    if (!_sortSelector) {_sortSelector = @selector(compareScoreToGameResult:);}
    return _sortSelector;
}

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}


- (IBAction)sortByDate {
    self.sortSelector = @selector(compareEndDateToGameResult:);
}

- (IBAction)sortByScore {
    self.sortSelector = @selector(compareScoreToGameResult:);
}

- (IBAction)sortByDuration {
    self.sortSelector = @selector(compareDurationToGameResult:);
}




- (void)setup {

}

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

@end
