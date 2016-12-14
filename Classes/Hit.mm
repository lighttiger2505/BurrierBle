//
//  Hit.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Hit.h"

@implementation Hit

@synthesize myPoint;
@synthesize hitRange;
@synthesize attackPawer;

- (id)init
{
	[super init];
	return self;
}

- (void)setting :(float)setHitRange
{
	hitRange = setHitRange;
}

- (void)setting :(float)setHitRange power:(int)setAttackPower
{
	hitRange = setHitRange;
	attackPawer = setAttackPower;
}

- (bool)judgment :(Hit*)targetHitData
{
	const float range = Distance(myPoint.x, 
								 myPoint.y, 
								 targetHitData.myPoint.x, 
								 targetHitData.myPoint.y);
	if(range < hitRange + targetHitData.hitRange){
		return true;
	}
	return false;
}

- (void)dealloc
{
	[super dealloc];
}

@end
