//
//  TransitionScene.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AbstrustScene.h"

@interface TransitionScene : NSObject {
	NSMutableDictionary*  sceneArray;
	NSString*             nextSceneKey;
	enum TRANSITION_STATE transitionState;
	
}

+ (TransitionScene*)sharedTransitionScene;
- (id)init;
- (void)addScene:(AbstrustScene*)setScene SceneKey:(NSString*)setSceneKey;
- (void)setNextTrantionScene:(NSString*)nextScene;
- (AbstrustScene*)getSceneForKey:(NSString*)sceneKey;
- (AbstrustScene*)getNextScene;
- (void)dealloc;

@property(readonly)enum TRANSITION_STATE transitionState;

@end
