//
//  BurrierBle.h
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"
#import "EffectArray.h"
#import "HitMediation.h"
#import "BurrierArray.h"
#import "SoundManager.h"

#import "Calculation.h"

enum STATE { NEUTRAL, MOVE, SHOCK };

//タッチ有効範囲
#define TOUCH_VALID_RANGE 90
//タッチ座標調整用
#define ADJUSTMENT_CENTER_RANGE  180
#define ADJUSTMENT_MOVE_RANGE  32
#define ADJUSTMENT_MAX_RANGE   100
#define ADJUSTMENT_MIN_RANGE   120
//ダメージの停止フレーム数
#define SHOCK_TIME 45

@interface BurrierBle : DrawObj {
	CGPoint movePoint;
	CGPoint previousPoint;
	float   moveSpeed;
	int     timer;
	enum STATE state;
	
	//リソース管理オブジェクト
	SoundManager* sound;
	//他オブジェクトとの結合
	BurrierBle*   pairBurrireBle;
	BurrierArray* burrier;
	EffectArray*  effect;  
	HitMediation* mediation;
}

- (id)init :(CGPoint)point;
- (void)connectObj: (BurrierBle*)setBurrierBle 
		   Burrier:(BurrierArray*)setBurrier 
	   EffectArray:(EffectArray*)setEffectArray 
	  HitMediation:(HitMediation*)setMediation;

- (void)connectResource:(SoundManager*)setSound;

- (void)changeToNeutralState;
- (void)changeToMoveState;
- (void)changeToShockState;

- (BOOL)RecognitioFinger:(CGPoint)toPonit;
- (BOOL)checkBeginTouch:(CGPoint)toPoint;
- (BOOL)checkMoveTouch:(CGPoint)nowPoint 
			beforPoint:(CGPoint)beforPoint;
- (void)checkEndTouch:(CGPoint)nowPoint 
		   beforPoint:(CGPoint)beforPoint;

- (void)upDate;
- (void)subUpDate;
- (void)dealloc;

@property(readonly) CGPoint previousPoint;
@property(readonly) enum STATE state;

@end
