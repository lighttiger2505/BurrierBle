//
//  GameOverScene.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameOverScene.h"


@implementation GameOverScene

- (id)init
{
	[super init];
	gameOverFont = [[DrawObj alloc] init];
	[gameOverFont setGraph:[texture getTextureForKey:@"game_over_font"]];
	[gameOverFont setLocation:CGPointMake(160.0f, 240.0f)];
	return self;
}

- (void)upDateScene
{
	
}

- (void)renderScene
{
	[gameOverFont draw];
}

- (void)dealloc
{
	[gameOverFont dealloc];
	[super dealloc];
}

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	transitionState = CHANGE;
	nextSceneKey = @"title";
}

- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	
}

- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	
}

@end
