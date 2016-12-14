/*
 *  Image.h
 *  OGLGame
 *
 *  Created by Ohashi-iPhoneDev on 09/12/17.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>
#import <OpenGLES/ES1/gl.h>

#import "Image.h"

@interface MyTexture : NSObject
{
@private
	//テクスチャデータ
	Image* texture;
	//画像サイズ情報
	int width;
	int height;
	int flameNum;
}

- (id) initWithLoad: (NSString*)textureName;
- (id) initWithImage: (NSString*)textureName width:(int)setWidth heigth:(int)setHeight flameNum:(int)setFlameNum;
- (void)load: (NSString*)textureName;
- (void)drawAtPoint: (CGPoint)drawPoint flame:(int)flame angle:(float)angle scale:(float)scale alpha:(float)alpha;
- (void)drawLengthOfWidth:(CGPoint)leftEdgePoint Length:(float)length Angle:(float)angle Scale:(float)scale Alpha:(float)alpha;

- (int)getFlameNum;

- (void)dealloc;

@property(readonly)int width;
@property(readonly)int height;

@end
