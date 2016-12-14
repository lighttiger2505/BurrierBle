//
//  Gauge.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"


@interface Gauge : DrawObj {
	float nowAmount;
	float maxAmount;
	float length;
}

- (id)init:(CGPoint)setPoint 
	   Max:(float)setMax 
	Length:(float)setLength;

- (void)upGauge:(int)val;
- (void)downGauge:(int)val;
- (float)getShowLength;

- (void)draw;

- (void)dealloc;

@property(readonly)float nowAmount;
@end
