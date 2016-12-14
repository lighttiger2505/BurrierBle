//
//  Effect.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Effect.h"


@implementation Effect

@synthesize flag;

- (id)init
{
	[super init];
	return self;
}

- (void)setting :(CGPoint)setPoint 	   
		   angle:(float)setAngle 
		   scale:(float)setScale 
		   alpha:(float)setAlpha
{
	[super setLocation:setPoint];
	[super setAngle:setAngle];
	[super setScale:setScale];
	[super setAlpha:setAlpha];
	[animetion clear];
	flag = true;
}

- (void)checkAnimetionEnd
{
	if([animetion chackLoop]){
		flag = false;
	}
}

- (void)dealloc
{
	[super dealloc];
}

@end
