//
//  AbstrustScene.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#import "TextureManager.h"
#import "SoundManager.h"

enum TRANSITION_STATE {
	RUNNING,
	CHANGE,
};

@interface AbstrustScene : NSObject {
	TextureManager* texture;
	SoundManager*   sound;
	
	NSString*             nextSceneKey;
	enum TRANSITION_STATE transitionState;
}

- (id)init;
- (void)connectResource:(TextureManager*)setTexture 
				  Sound:(SoundManager*)setSound;
- (void)upDateScene;
- (void)renderScene;

- (void)playBackMusic;

- (void)dealloc;

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;

@property(readonly)NSString* nextSceneKey;
@property(readonly)enum TRANSITION_STATE transitionState;

@end
