//
//  Level.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"


@implementation Level

- (id)init :(int)setFirst last:(int)setLast
{
	[super init];
	first = setFirst;
	last  = setLast;
	return self;
}

- (bool)checkRange :(int)val
{
	if(first <= val){
		if(last >= val){
			return true;
		}
	}
	return false;
}

- (void)dealloc
{
	[super dealloc];
}

@end
