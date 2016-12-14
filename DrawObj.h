//
//  DrawObj.h
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/19.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "MyTexture.h"
#import "Animetion.h"

@interface DrawObj : NSObject {
	CGPoint location;
	float   angle;
	float   scale;
	float   alpha;
	
	MyTexture* texture;
	Animetion* animetion;
}

- (id)init;
- (id)init: (CGPoint)point :(MyTexture*)setGraph;

- (void)setLocation :(CGPoint)setLocation;
- (void)setGraph:(MyTexture*)setGraph;
- (void)setAngle:(float)toAngle;
- (void)setScale:(float)toScale;
- (void)setAlpha:(float)toAlpha;

- (void)draw;

- (void)dealloc;

@property(readwrite)CGPoint location;
@property(readonly)float angle;

@end
