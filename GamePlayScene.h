//
//  GamePlayScene.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AbstrustScene.h"

#import "EnemyDataBase.h"
#import "EffectArray.h"
#import "HitMediation.h"

#import "Stage.h"
#import "BackGround.h"
#import "Gauge.h"
#import "Score.h"
#import "TouchBeacon.h"

#import "DifenseObject.h"
#import "BurrierBle.h"
#import "BurrierArray.h"
#import "EnemyArray.h"


@interface GamePlayScene : AbstrustScene {
	//================================================
	//GameEngine
	EnemyDataBase* enemyDataBase;
	EffectArray*   effectArray;
	HitMediation*  mediation;
	
	//================================================
	//GameCharctor
	Stage*         stage;
	BackGround*    backGround;
	Gauge*         lifeGauge;
	Score*         score;
	
	TouchBeacon*   beaconOne;
	TouchBeacon*   beaconTwo;
	DifenseObject* difenseObject;
	BurrierBle*    burrierBleOne;
	BurrierBle*    burrierBleTwo;
	BurrierArray*  burrierArray;
	EnemyArray*    enemyArray;
}

- (id)init;
- (void)upDateScene;
- (void)renderScene;
- (void)dealloc;

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;

@end
