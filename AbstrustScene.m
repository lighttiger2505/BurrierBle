//
//  AbstrustScene.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AbstrustScene.h"


@implementation AbstrustScene

@synthesize nextSceneKey;
@synthesize transitionState;

- (id)init
{
	[super init];
	nextSceneKey = nil;
	transitionState = RUNNING;
	texture = [TextureManager sharedTextureManager];
	sound   = [SoundManager sharedSoundManager];
	return self;
}

- (void)connectResource:(TextureManager*)setTexture 
				  Sound:(SoundManager*)setSound
{
	texture = [setTexture retain];
	sound   = [setSound   retain]; 
}

- (void)upDateScene{}

- (void)renderScene{}

- (void)playBackMusic
{
	[sound loadBackMusic:@"game_main_01" FileType:@"caf"];
	[sound playBackMusic];
}

- (void)dealloc
{
	[texture release];
	[sound   release];
	[super dealloc];
}

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view{}
- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view{}
- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view{}

@end
