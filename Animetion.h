//
//  Animetion.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@interface Animetion : NSObject {
	int  showFlame;
	int  flameWait;
	bool animetionFlag;
	bool loopFlag;
}

- (id)init;
- (void)clear;

- (bool)chackLoop;
- (void)nonAnimetion;
- (bool)getAnimetionFlag;
- (void)setShowFlame:(int)setFlame;
- (int)getShowFlame;

- (void)countWait: (int)flameAll;

- (void)dealloc;

@end
