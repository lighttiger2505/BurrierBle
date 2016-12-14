//
//  TransitionScene.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransitionScene.h"

@implementation TransitionScene

@synthesize transitionState;

+ (TransitionScene*)sharedTransitionScene
{ 
	static TransitionScene* sharedInstance = nil;
	if (!sharedInstance)
	{
		sharedInstance = [[self alloc] init];
	}
	return sharedInstance;
}

- (id)init
{
	[super init];
	sceneArray = [[NSMutableDictionary alloc]init];
	transitionState = RUNNING;
	nextSceneKey = nil;
	return self;
}

- (void)addScene:(AbstrustScene*)setScene SceneKey:(NSString*)setSceneKey
{
	[sceneArray setObject:setScene forKey:setSceneKey];
}

- (void)setNextTrantionScene:(NSString*)setNextSceneKey
{
	nextSceneKey = setNextSceneKey;
	transitionState = CHANGE;
}

- (AbstrustScene*)getSceneForKey:(NSString*)sceneKey;
{
	AbstrustScene* returnScene = [sceneArray objectForKey:sceneKey];
	return returnScene;
}

- (AbstrustScene*)getNextScene
{
	AbstrustScene* returnScene = [sceneArray objectForKey:nextSceneKey];
	return returnScene;
}

- (void)dealloc
{
	[sceneArray dealloc];
	[super dealloc];
}

@end
