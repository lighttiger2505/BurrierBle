//
//  EffectArray.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Effect.h"
#import "TextureManager.h"

#define EFFECT_MAX 30

@interface EffectArray : NSObject {
	Effect* array[EFFECT_MAX];
	int lastReference;
	
	TextureManager* texture;
}

- (id)init;
- (void)connectResource:(TextureManager*)setTexture;
- (void)add :(CGPoint)setPoint 
	 GraphID:(NSString*)setGraphId
	   angle:(float)setAngle 
	   scale:(float)setScale 
	   alpha:(float)setAlpha;
- (void)draw;
- (int)empty;
- (void)dealloc;

@end
