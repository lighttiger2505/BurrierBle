//
//  Score.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Score.h"


@implementation Score

- (id)init:(CGPoint)setLocation Digit:(int)setDigit;
{
	[super init];
	[super setLocation:setLocation];
	number = 0;
	digit  = setDigit;
	return self;
}

- (void)upScore:(int)val
{
	number += val;
}

- (void)draw
{
	int score = number; 
	for(int i = digit; i > 0; i--){
		int showScore = score % 10;
		score = score / 10;
		[texture drawAtPoint:CGPointMake(location.x + i * texture.width, location.y) 
					   flame:showScore 
					   angle:angle 
					   scale:scale 
					   alpha:alpha];
	}
}

- (void)dealloc
{
	[super dealloc];
}

@end
