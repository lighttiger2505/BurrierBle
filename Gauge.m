//
//  Gauge.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Gauge.h"

@implementation Gauge

@synthesize nowAmount;

- (id)init:(CGPoint)setPoint Max:(float)setMax Length:(float)setLength
{
	[super init];
	[super setLocation:setPoint];
	[super setAlpha:0.6f];
	
	nowAmount = setMax;
	maxAmount = setMax;
	length    = setLength;
	
	return self;
}

- (void)upGauge:(int)val
{
	nowAmount += val;
	if(val > maxAmount){
		val = maxAmount;
	}
}

- (void)downGauge:(int)val
{
	nowAmount -= val;
	if(val < 0){
		val = 0;
	}
}

- (float)getShowLength
{
	float showRatio = nowAmount / maxAmount;
	float showLength = length * showRatio;
	return showLength;
}

- (void)draw
{
	[texture drawLengthOfWidth:location 
						Length:[self getShowLength] 
						 Angle:angle 
						 Scale:scale 
						 Alpha:alpha];
}
- (void)dealloc
{
	[super dealloc];
}

@end
