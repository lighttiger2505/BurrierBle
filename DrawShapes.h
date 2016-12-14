/*
 *  graphUtill.h
 *  BurrierBle
 *
 *  Created by Ohashi-iPhoneDev on 09/12/26.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

//OpenGL関連のヘッダーファイルをインポートします
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

//線描画
void drawLine(CGPoint start, CGPoint end);
//四角形描画
void drawSquare(float x, float y, float width, float height, int red, int green, int blue, int alpha);
//円描画
void drawCircle(float x, float y, int divides, float radius, int red, int green, int blue, int alpha);
//曲線描画
void drawCurve();