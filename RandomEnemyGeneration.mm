//
//  RandomEnemyGeneration.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RandomEnemyGeneration.h"


@implementation RandomEnemyGeneration

@synthesize generationEnemyId;

- (id)init:(NSString*)setEnemyId
Probability:(int)setProbability
 SpeedHine:(float)setSpeedHine 
  SpeedLow:(float)setSpeedLow
 AngleHine:(float)setAngleHine
  AngleLow:(float)setAngleLow 
{
	[super init];
	generationEnemyId = setEnemyId;
	probability   = setProbability;
	moveSpeedHigh = setSpeedHine;
	moveSpeedLow  = setSpeedLow;
	moveAngleHine = setAngleHine;
	moveAngleLow  = setAngleLow;
	
	return self;
}

- (bool)checkGeneration
{
	int randomProbability = rand() % probability;
	if(!randomProbability){
		return true;
	}
	return false;
}

- (float)getMoveSpeed
{
	int tempHine = moveSpeedHigh * 100;
	int tempLow  = moveSpeedLow  * 100;
	int randomSpeed = (rand() % (tempHine - tempLow)) + tempLow;
	return randomSpeed / 100;
}

- (float)getMoveAngle
{
	int tempHine = moveAngleHine * 100;
	int tempLow  = moveAngleLow  * 100;
	int randomAngle = (rand() % (tempHine - tempLow)) + tempLow;
	return randomAngle / 100;
}

- (void)dealloc
{
	[super dealloc];
}

@end
