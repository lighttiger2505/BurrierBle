//
// TextureManager.h
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTexture.h"


@interface TextureManager : NSObject {
@private
	NSMutableDictionary *array;
}
+ (TextureManager*)sharedTextureManager;
- (id)init;

- (void)drawForKey:(NSString*)textureID 
		 drawPoint:(CGPoint)point 
			 flame:(int)flame 
			 angle:(float)angle 
			 scale:(float)scale 
			 alpha:(float)alpha;

- (MyTexture*)getTextureForKey:(NSString*)TextureID;
- (int)getFlameForKey :(int)TextureID;
- (void)dealloc;

@end
