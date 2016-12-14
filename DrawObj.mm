//
//  DrawObj.m
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/19.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"


@implementation DrawObj

@synthesize location;
@synthesize angle;

- (id)init{
	[super init];
	
	angle = 0.0f;
	scale = 1.0f;
	alpha = 1.0f;
	texture   = nil;
	animetion = [[Animetion alloc] init];
	
	return self;
}

- (id)init: (CGPoint)point :(MyTexture*)setGraph{
	[super init];
	location = point;
	texture = setGraph;
	angle = 0.0f;
	scale = 1.0f;
	alpha = 1.0f;
	
	animetion = [[Animetion alloc] init];
	return self;
}

- (void)setLocation :(CGPoint)setLocation{
	location = setLocation;
}

- (void)setGraph :(MyTexture*)setGraph{
	texture = setGraph;
}

- (void)setAngle :(float)toAngle{
	angle = toAngle;
}

- (void)setScale :(float)toScale{
	scale = toScale;
}

- (void)setAlpha :(float)toAlpha{
	alpha = toAlpha;
}

- (void)draw
{
	[texture drawAtPoint:location 
				   flame:[animetion getShowFlame] 
				   angle:angle scale:scale 
				   alpha:alpha];
	
	if([animetion getAnimetionFlag]){
		[animetion countWait:[texture getFlameNum]];
	}

}

- (void)dealloc{
	[animetion release];
	[super dealloc];
}

@end
