//
//  GameController.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransitionScene.h"

#import "AbstrustScene.h"
#import "TitleScene.h"
#import "GamePlayScene.h"
#import "GameOverScene.h"

#import "TextureManager.h"
#import "SoundManager.h"

@interface GameController : NSObject {
	//更新するシーンオブジェクト
	AbstrustScene*   crrentScene;
	TransitionScene* sceneManager;
	//ゲームに使用するリソース
	TextureManager* texture;
	SoundManager* sound;
}

- (id)init;
- (void)transitionNextScene;
- (void)upDateScene;
- (void)renderScene;

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;

- (void)dealloc;

@end
