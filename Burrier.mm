//
//  Burrier.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Burrier.h"


@implementation Burrier

@synthesize flag;

- (id)init{
	[super init];
	flag = false;
	return self;
}

- (void)clear{
	flag = false;
	//[animetion clear];
}

- (void)setting :(CGPoint)setPoint angle:(float)setAngle{
	[super setLocation:setPoint];
	[super setAngle:setAngle];
	flag = true;
}

- (bool)getFlag{
	return flag;
}

- (void)dealloc{
	[super dealloc];
}

@end
