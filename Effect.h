//
//  Effect.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "DrawObj.h"

@interface Effect : DrawObj {
	bool flag;
}

- (id)init;
- (void)setting :(CGPoint)setPoint 	   
		   angle:(float)setAngle 
		   scale:(float)setScale 
		   alpha:(float)setAlpha;

- (void)checkAnimetionEnd;
- (void)dealloc;

@property(readonly)bool flag;

@end
