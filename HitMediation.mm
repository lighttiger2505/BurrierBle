//
//  HitMediation.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HitMediation.h"

@implementation HitMediation

@synthesize breakFlag;

- (id)init{
	[super init];
	breakFlag = false;
	return self;
}

- (void)HitResult:(int)result
{
	if(result == 1){
		breakFlag = true;
	}
}

- (void)upDate
{
}

- (void)dealloc
{
	[super dealloc];
}

@end
