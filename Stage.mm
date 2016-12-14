//
//  Stage.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Stage.h"


@implementation Stage

- (id)init
{
	[super init];
	randomEvent = [[NSMutableArray alloc] init];
	[randomEvent addObject:[[RandomEnemyGeneration alloc] init:@"meteo_blue" Probability:20 SpeedHine:5 SpeedLow:4 AngleHine:415 AngleLow:315]];
	[randomEvent addObject:[[RandomEnemyGeneration alloc] init:@"meteo_green" Probability:100 SpeedHine:3 SpeedLow:2 AngleHine:415 AngleLow:315]];
	[randomEvent addObject:[[RandomEnemyGeneration alloc] init:@"meteo_red" Probability:200 SpeedHine:2 SpeedLow:1 AngleHine:415 AngleLow:315]];
	timeLine = 0;
	return self;
}

- (void)connectObj:(EnemyArray*)setEnemy
{
	enemy = setEnemy;
}

- (void)randomGeneration
{
	for(RandomEnemyGeneration* eventData in randomEvent){
		if([eventData checkGeneration]){
			int generationX = rand() % 320;
			float randomSpeed = [eventData getMoveSpeed];
			float randomAngle = [eventData getMoveAngle];
			float speedX = randomSpeed * sin(ConversionRadian(randomAngle));
			float speedY = randomSpeed * cos(ConversionRadian(randomAngle));
	
			[enemy add:eventData.generationEnemyId setLocation:CGPointMake(generationX,0) XSpeed:speedX YSpeed:speedY];
		}
	}
	
}

- (void)countTimeLine
{
	timeLine ++;
}

- (void)upDate
{
	[self randomGeneration];
	[self countTimeLine];
}

- (void)dealloc
{
	[super dealloc];
}
@end
