//
//  BurrierHit.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/04.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Hit.h"
#import "EnemyArray.h"

@interface BurrierHit : NSObject {
	CGPoint location;
	int     attackPower;
	bool    flag;
	
	Hit* hit;
}

- (id)init;
- (void)clear;
- (void)setting :(CGPoint)setPoint power:(int)setAttackPower;
- (void)judgmentHit :(EnemyArray*)enemyArray;
- (void)dealloc;

@property(readonly)bool flag;

@end
