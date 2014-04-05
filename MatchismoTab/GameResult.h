//
//  GameResult.h
//  MatchismoTab
//
//  Created by Chong Lian on 4/4/14.
//  Copyright (c) 2014 Chong Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

+ (NSArray *)allGameResults; // of GameResult

- (NSComparisonResult)compareScoreToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareEndDateToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(GameResult *)otherResult;

@end
