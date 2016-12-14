//
//  Burrier.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"

@interface Burrier : DrawObj {
	bool flag;
}

- (id)init;
- (void)clear;
- (void)setting :(CGPoint)setPoint angle:(float)setAngle;
- (void)dealloc;

@property(readonly)bool flag;

@end
