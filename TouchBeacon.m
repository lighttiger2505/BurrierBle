//
//  TouchBeacon.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchBeacon.h"


@implementation TouchBeacon

- (id)init
{
	[super init];
	[super setScale:0.8f];
	[super setAlpha:0.8f];
	return self;
}

- (void)connectObj:(BurrierBle*)setBurrierBle;
{
	burrierBle = setBurrierBle;
}

- (void)changeRote
{
	if(burrierBle.state == MOVE){
		angle += 5.0f;
	}else{
		angle += 1.0f;
	}		
	if(angle >= 360.0f){
		angle = 0.0f;
	}
}

- (void)changeScale
{
	if(burrierBle.state == MOVE){
		scale = 1.2f;
	}else{
		scale = 0.8f;
	}

}

- (void)upDate
{
	[self changeRote];
	[self changeScale];
}

- (void)draw
{
	[texture drawAtPoint:burrierBle.location flame:0 angle:angle scale:scale alpha:alpha];
}

- (void)dealloc
{
	[super dealloc];
}

@end
