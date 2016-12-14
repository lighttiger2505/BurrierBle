//
//  DifenseObject.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"
#import "Gauge.h"

@interface DifenseObject : DrawObj {
	float moveSpeed;
	Gauge* lifeGauge;
}

- (id)init;
- (void)connectObj:(Gauge*)setGauge;
- (bool)judgmentHit:(CGPoint)toPoint damage:(int)damage;
- (void)upDate;
- (void)dealloc;

@end
