//
//  RandomEnemyGeneration.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface RandomEnemyGeneration : NSObject {
	NSString* generationEnemyId;
	int probability;
	float moveSpeedHigh;
	float moveSpeedLow;
	float moveAngleHine;
	float moveAngleLow;
}

- (id)init:(NSString*)setEnemyId 
Probability:(int)setProbability
 SpeedHine:(float)setSpeedHine 
  SpeedLow:(float)setSpeedLow
 AngleHine:(float)setAngleHine
  AngleLow:(float)setAngleLow;

- (bool)checkGeneration;
- (float)getMoveSpeed;
- (float)getMoveAngle;

- (void)dealloc;

@property(readonly)NSString* generationEnemyId;

@end
