//
//  EnemyData.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EnemyData.h"


@implementation EnemyData

@synthesize graphId;
@synthesize downEffect;
@synthesize durability;
@synthesize attakPower;
@synthesize getScore;
@synthesize hitRange;

- (id)init :(NSString*)setGraphId 
 DownEffect:(NSString*)setDownEffect 
 Durability:(int)setDurability 
 AttakPower:(int)setAttakPower 
   GetScore:(int)setGetScore
   hitRange:(int)setHitRange;
{
	[super init];
	graphId =    setGraphId;
	downEffect = setDownEffect;
	durability = setDurability;
	attakPower = setAttakPower;
	getScore   = setGetScore;
	hitRange =   setHitRange;
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

@end
