//
//  DifenseObject.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DifenseObject.h"

#import "DrawShapes.h"

@implementation DifenseObject

- (id)init
{
	//防衛対象描画設定
	[super init];
	[super setLocation:CGPointMake(160.0f,460.0f)];
	[super setScale:2.0f];
	moveSpeed = 0.1f;
	
	return self;
}

- (void)connectObj:(Gauge*)setGauge
{
	lifeGauge = setGauge;
}

- (bool)judgmentHit:(CGPoint)toPoint damage:(int)damage;
{
	if(toPoint.x > 30  && toPoint.x < 290 &&
	   toPoint.y > 510 && toPoint.y < 530)
	{
		[lifeGauge downGauge:damage];
		return true;
	}
	return false;
}

- (void)move
{
	location.y += moveSpeed;
	if(location.y < 450){
		moveSpeed = 0.1f;
	}
	if(location.y > 470){
		moveSpeed = -0.1f;
	}
}

- (void)upDate
{
	[self move];
}

- (void)dealloc
{
	[lifeGauge release];
	[super dealloc];
}

@end
