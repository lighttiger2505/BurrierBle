//
//  BurrierHit.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BurrierHit.h"

@implementation BurrierHit

@synthesize flag;
	
- (id)init
{
	[super init];
	flag = false;
	hit = [[Hit alloc] init];
	return self;
}

- (void)clear
{
	flag = false;
}

- (void)setting :(CGPoint)setPoint power:(int)setAttackPower
{
	location = setPoint;
	attackPower = setAttackPower;
	flag = true;
	[hit setting:0.5f power:attackPower];
}

- (bool)getFlag
{
	return flag;
}

- (void)judgmentHit :(EnemyArray*)enemyArray
{
	[hit setMyPoint:location];
	[enemyArray judgmentHit:hit];
}

- (void)dealloc
{
	[hit release];
	[super dealloc];
}

@end
