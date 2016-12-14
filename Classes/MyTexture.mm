/*
 *  ship.mm
 *  OGLGame
 *
 *  Created by Ohashi-iPhoneDev on 09/12/17.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import "MyTexture.h"

@implementation MyTexture

@synthesize width;
@synthesize height;

- (id)initWithLoad: (NSString*) textureName{
	[super init];
	[self load: textureName];
	return self;
}

- (id) initWithImage: (NSString*)textureName width:(int)setWidth heigth:(int)setHeight flameNum:(int)setFlameNum;{
	[super init];
	[self load: textureName];
	width = setWidth;
	height = setHeight;
	flameNum = setFlameNum;
	return self;
}

- (void)load: (NSString*)textureName{
	texture = [[Image alloc] initWithImage:[UIImage imageNamed:textureName]filter:GL_LINEAR];
}
- (void)draw:(CGPoint) drawPoint{
	[texture renderAtPoint:drawPoint centerOfImage:YES];
}

- (void)drawAtPoint: (CGPoint)drawPoint 
			  flame:(int)flame 
			  angle:(float)angle 
			  scale:(float)scale 
			  alpha:(float)alpha
{
	[texture setRotation:angle];
	[texture setScale:scale];
	[texture setAlpha:alpha];
	[texture renderSubImageAtPoint:drawPoint 
							offset:CGPointMake(width*flame, 0) 
					 subImageWidth:width 
					subImageHeight:height 
					 centerOfImage:YES];
}

- (void)drawLengthOfWidth:(CGPoint)leftEdgePoint 
				   Length:(float)length 
					Angle:(float)angle 
					Scale:(float)scale 
					Alpha:(float)alpha
{
	[texture setRotation:angle];
	[texture setScale:scale];
	[texture setAlpha:alpha];
	[texture renderSubImageAtPoint:leftEdgePoint
							offset:CGPointMake(0, 0) 
					 subImageWidth:length 
					subImageHeight:height 
					 centerOfImage:NO];
}

- (int)getFlameNum{
	return flameNum;
}

- (void)dealloc{
	[texture release];
	[super dealloc];
}

@end

