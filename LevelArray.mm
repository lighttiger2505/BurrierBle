//
//  LevelArray.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LevelArray.h"


@implementation LevelArray

- (id)init
{
	[super init];
	array = [[NSMutableArray alloc] init];
	[array addObject :[[Level alloc] init:161 last:1000]];
	[array addObject :[[Level alloc] init:76 last:160]];
	[array addObject :[[Level alloc] init:0 last:75]];
	return self;
}

- (int)getLevel :(int)val
{
	int level = 1;
	for(Level* levels in array){
		if([levels checkRange:val]){
			return level;
		}
		level ++;
	}
	return 0;
}
	
- (void)dealloc
{
	[array release];
	[super dealloc];
}

@end
