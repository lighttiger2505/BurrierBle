//
//  BurrierBle.m
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BurrierBle.h"

@implementation BurrierBle

@synthesize previousPoint;
@synthesize state;

- (id)init :(CGPoint)point{
	[super init];
	[super setLocation:point];
	[super setScale:1.2f];
	[self changeToNeutralState];
	moveSpeed = 10;
	timer = 0;
	return self;
}

- (void)connectObj: (BurrierBle*)setBurrierBle 
		   Burrier:(BurrierArray*)setBurrier 
	   EffectArray:(EffectArray*)setEffectArray 
	  HitMediation:(HitMediation*)setMediation
{
	pairBurrireBle = [setBurrierBle retain];
	burrier        = [setBurrier retain];
	effect         = [setEffectArray retain];
	mediation      = [setMediation retain];
}

- (void)connectResource:(SoundManager*)setSound
{
	sound = setSound;
}

- (void)changeToNeutralState
{
	[animetion clear];
	state = NEUTRAL;
}

- (void)changeToMoveState
{
	[animetion clear];
	state = MOVE;
}

- (void)changeToShockState
{
	if(state != SHOCK){
		[animetion clear];
		state = SHOCK;
		
		[burrier burrierBreak];
		[burrier clear];
	}
}

//バリアが破壊されたかの確認
- (void)checkBurrierBreak
{
	if(mediation.breakFlag){
		[self changeToShockState];
		[pairBurrireBle changeToShockState];
		mediation.breakFlag = false;
		
		[sound playSoundWithKey:@"bom_002" gain:0.45f pitch:1.0f location:Vector2fZero shouldLoop:NO];
	}
}

- (void)neutralAction
{
	//バリアを発生
	[burrier movement:location :pairBurrireBle.location];
	[self checkBurrierBreak];
}

- (void)lowSpeedMove:(float)range
{
	//移動しなくてもよい場合は
	if(range > 1){
		//指の座標に移動
		const float moveX = (movePoint.x - location.x) / range * 1;
		const float moveY = (movePoint.y - location.y) / range * 1;
		location.x += moveX;
		location.y += moveY;
	}
}

- (void)moveAction
{
	//距離計算
	const float range = Distance(location.x, location.y, movePoint.x, movePoint.y);
	if(range > 12){
		//指の座標に移動
		const float moveX = (movePoint.x - location.x) / range * moveSpeed;
		const float moveY = (movePoint.y - location.y) / range * moveSpeed;
		location.x += moveX;
		location.y += moveY;
	}else{
		[self lowSpeedMove:range];
	}
	//バリアを発生
	[burrier movement:location :pairBurrireBle.location];
	[self checkBurrierBreak];
}

- (void)shockAction
{
	//カウントが規定時間に達しているなら
	if(timer > SHOCK_TIME){
		//待機状態へ移行
		[self changeToNeutralState];
		//タイマの初期化
		timer = 0;
		return;
	}
	//カウントする
	timer ++;
}

//状態ごとのアクションを行う
- (void)stateAction
{
	switch (state) {
		case NEUTRAL:
			[self neutralAction];
			break;
		case MOVE:
			[self moveAction];
			break;
		case SHOCK:
			[self shockAction];
			break;
		default:
			break;
	}
}

//対応バリアブルの方向へ向かせる
- (void)changeAngle{
	float xDifference = location.x - pairBurrireBle.location.x;
	float yDifference = location.y - pairBurrireBle.location.y;
	float theta = ConversionAngle(atan2(xDifference, yDifference));
	[self setAngle: theta];
}

//タッチ有効範囲の確認
- (BOOL)checkRange: (CGPoint)toPoint{
	float range = Distance(location.x, location.y, toPoint.x, toPoint.y);
	if(range <= TOUCH_VALID_RANGE){
		return YES;
	}
	return NO;
}

//前回の座標から指を識別
- (BOOL)RecognitioFinger:(CGPoint)toPonit
{
	if(toPonit.x == previousPoint.x && 
	   toPonit.y == previousPoint.y){
		return YES;
	}
	return NO;
}

//指の位置から移動させる座標の調節
- (void)adjustmentMovePoint:(CGPoint)toPoint
{
	const float range = Distance(toPoint.x, 
								 toPoint.y, 
								 pairBurrireBle.location.x,
								 pairBurrireBle.location.y);
	const float rangeDifferent = range - ADJUSTMENT_CENTER_RANGE;
	float adjustmentX;
	float adjustmentY;
	float moveDifferent;
	
	if(rangeDifferent == 0 ){
		adjustmentX = 0.0f;
		adjustmentY = 0.0f;
	}else if(rangeDifferent < 0){
		moveDifferent = rangeDifferent / ADJUSTMENT_MAX_RANGE * ADJUSTMENT_MOVE_RANGE;
		if(moveDifferent < -16){
			moveDifferent = -16;
		}
		adjustmentX = SnipX(location.x, pairBurrireBle.location.x, range, moveDifferent);
		adjustmentY = SnipY(location.y, pairBurrireBle.location.y, range, moveDifferent);
	}else if(rangeDifferent > 0){
		moveDifferent = rangeDifferent / ADJUSTMENT_MIN_RANGE * ADJUSTMENT_MOVE_RANGE;
		if(moveDifferent > 16){
			moveDifferent = 16;
		}
		adjustmentX = SnipX(location.x, pairBurrireBle.location.x, range, moveDifferent);
		adjustmentY = SnipY(location.y, pairBurrireBle.location.y, range, moveDifferent);
	}

	movePoint = CGPointMake(toPoint.x + adjustmentX, toPoint.y + adjustmentY);
}

//ビューからのタッチ開始時イベントの受け取り
- (BOOL)checkBeginTouch:(CGPoint)toPoint
{
	if(state == NEUTRAL){
		if([self checkRange:toPoint]){
			[self adjustmentMovePoint:toPoint];
			previousPoint = toPoint;
			[self changeToMoveState];
			return YES;
			}
		}
	return NO;
}

//ビューからのタッチ移動時のイベント受け取り
- (BOOL)checkMoveTouch:(CGPoint)nowPoint 
			beforPoint:(CGPoint)beforPoint
{
	if(state == MOVE){
		if([self RecognitioFinger:beforPoint]){
			[self adjustmentMovePoint:nowPoint];
			previousPoint = nowPoint;
			return YES;
		}
	}
	if(state == NEUTRAL){
		if(![pairBurrireBle RecognitioFinger:beforPoint]){
			if([self checkRange:nowPoint]){
				[self adjustmentMovePoint:nowPoint];
				previousPoint = nowPoint;
				[self changeToMoveState];
				return YES;
			}
		}
	}
	return NO;
}

//ビューからのタッチ終了時のイベント受け取り
- (void)checkEndTouch:(CGPoint)nowPoint 
		   beforPoint:(CGPoint)beforPoint
{
	if(state == MOVE){
		if([self RecognitioFinger:nowPoint]){
			[self changeToNeutralState];
			return;
		}
		if([self RecognitioFinger:beforPoint]){
			[self changeToNeutralState];
			return;
		}
	}
}

- (void)upDate{
	[self stateAction];
	[self changeAngle];
	[pairBurrireBle subUpDate];
}

- (void)subUpDate{
	[self stateAction];
	[self changeAngle];
}

- (void)dealloc{
	[pairBurrireBle release];
	[burrier release];
	[effect release];
	[mediation release];
	[super dealloc];
}

@end
