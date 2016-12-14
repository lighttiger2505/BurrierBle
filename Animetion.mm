//
//  Animetion.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Animetion.h"


@implementation Animetion

const int ANIMETION_WAIT = 4;

- (id)init{
	showFlame = 0;
	flameWait = 0;
	animetionFlag = true;
	loopFlag  = false;
	return self;
}

- (void)clear{
	[self init];
}

- (int)getShowFlame{
	return showFlame;
}
- (void)countWait: (int)flameAll{
	flameWait++;
	if(flameWait >= ANIMETION_WAIT){
		showFlame++;
		flameWait = 0;
		if(flameAll < showFlame){
			showFlame = 0;
			if(!loopFlag){
				loopFlag = true;
			}
		}
	}
}
- (bool)chackLoop{
	return loopFlag;
}

- (void)nonAnimetion{
	animetionFlag = false;
}

- (bool)getAnimetionFlag{
	return animetionFlag;
}

- (void)setShowFlame:(int)setFlame{
	showFlame = setFlame;
}

- (void)dealloc{
	[super dealloc];
}

@end
