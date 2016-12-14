//
//  Hit.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Calculation.h"

@interface Hit : NSObject {
	CGPoint myPoint;
	float hitRange;
	int   attackPawer;
}

- (id)init;
- (void)setting :(float)setHitRange;
- (void)setting :(float)setHitRange power:(int)setAttackPower;

- (bool)judgment :(Hit*)targetHitData;

- (void)dealloc;

@property(readwrite)CGPoint myPoint;
@property(readonly)float hitRange;
@property(readonly)int   attackPawer;

@end
