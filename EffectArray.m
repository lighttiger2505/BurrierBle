//
//  EffectArray.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EffectArray.h"


@implementation EffectArray

- (id)init
{
	[super init];
	for(int i = 0; i < EFFECT_MAX; i++){
		array[i] = [[Effect alloc] init];
	}
	lastReference = 0;
	return self;
}

- (void)connectResource:(TextureManager*)setTexture
{
	texture = setTexture;
}

- (void)add :(CGPoint)setPoint 
	 GraphID:(NSString*)setGraphId
	   angle:(float)setAngle 
	   scale:(float)setScale 
	   alpha:(float)setAlpha;
{
	int emptyNumber = [self empty];
	[array[emptyNumber] setGraph:[texture getTextureForKey:setGraphId]];
	[array[emptyNumber] setting:setPoint angle:setAngle scale:setScale alpha:setAlpha];
}

- (void)draw
{
	for(int i = 0; i < EFFECT_MAX; i++){
		if(array[i].flag){
			[array[i] draw];
			[array[i] checkAnimetionEnd];
		}
	}
}

- (int)empty
{
	for(int i = lastReference; i < EFFECT_MAX; i++){
		if(!array[i].flag){
			lastReference = i + 1;
			return i;
		}
	}
	for(int i = 0; i < EFFECT_MAX; i++){
		if(!array[i].flag){
			lastReference = i + 1;
			return i;
		}
	}
	return 0;
}

- (void)dealloc
{
	for(int i = 0; i < EFFECT_MAX; i++){
		[array[i] release];
	}
	[super dealloc];
}

@end
