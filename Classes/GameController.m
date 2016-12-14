//
//  GameController.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"


@implementation GameController

- (id)init
{
	[super init];
	//シーンを配列管理するオブジェクトを生成
	sceneManager = [[TransitionScene alloc] init];
	//各シーンの生成初期化をおこなう。
	AbstrustScene* initScene = [[TitleScene alloc] init];
	//初期化完了したシーンをマネージャーに追加していく
	[sceneManager addScene:initScene SceneKey:@"title"];
	//最初に実行するシーンを代入
	crrentScene = initScene;
	
	initScene = [[GamePlayScene alloc] init];
	[sceneManager addScene:initScene SceneKey:@"gameplay"];
	
	initScene = [[GameOverScene alloc] init];
	[sceneManager addScene:initScene SceneKey:@"gameover"];
	
	//BGMを再生
	[crrentScene playBackMusic];
	
	return self;
}

- (void)transitionNextScene
{
	if(crrentScene.transitionState == CHANGE){
		crrentScene = [sceneManager getSceneForKey:crrentScene.nextSceneKey];
		[crrentScene init];
		[sound playBackMusic];
	}
}

- (void)upDateScene
{
	[self transitionNextScene];
	[crrentScene upDateScene];
}

- (void)renderScene
{
	[crrentScene renderScene];
}

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	[crrentScene upDateTouchesBegin:touches withEvent:event withView:view];
}

- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	[crrentScene upDateTouchesMove:touches withEvent:event withView:view];
}

- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	[crrentScene upDateTouchesEnd:touches withEvent:event withView:view];
}

- (void)dealloc
{
	[crrentScene dealloc];
	[texture dealloc];
	[sound   dealloc];
	[super dealloc];
}


@end
