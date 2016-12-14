//
//  GamePlayScene.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GamePlayScene.h"


@implementation GamePlayScene

- (id)init
{
	[super init];
	//******************************************************************
	//オブジェクト生成
	enemyDataBase = [[EnemyDataBase alloc] init];
	effectArray   = [[EffectArray alloc] init];
	mediation     = [[HitMediation alloc] init];
	
	stage         = [[Stage alloc] init];
	backGround    = [[BackGround alloc] init];
	lifeGauge     = [[Gauge alloc] init:CGPointMake(20.0f, 60.0f) Max:100 Length:280];
	score         = [[Score alloc] init:CGPointMake(160.0f,20.0f) Digit:9];
	
	
	beaconOne     = [[TouchBeacon alloc] init];
	beaconTwo     = [[TouchBeacon alloc] init];
	difenseObject = [[DifenseObject alloc] init];
	burrierBleOne = [[BurrierBle alloc] init: CGPointMake( 80.0f, 240.0f)];
	burrierBleTwo = [[BurrierBle alloc] init: CGPointMake(240.0f, 240.0f)];
	burrierArray  = [[BurrierArray alloc] init];
	enemyArray    = [[EnemyArray alloc] init];
	
	//******************************************************************
	//オブジェクト同士の連結
	[stage         connectObj:enemyArray];
	[beaconOne     connectObj:burrierBleOne];
	[beaconTwo     connectObj:burrierBleTwo];
	[difenseObject connectObj:lifeGauge];
	[burrierBleOne connectObj:burrierBleTwo Burrier:burrierArray EffectArray:effectArray HitMediation:mediation];
	[burrierBleTwo connectObj:burrierBleOne Burrier:burrierArray EffectArray:effectArray HitMediation:mediation];
	[burrierArray  connectObj:enemyArray effect:effectArray];
	[enemyArray    connectObj:enemyDataBase TargetObject:difenseObject Effect:effectArray Mediation:mediation GameScore:score];
	
	//******************************************************************
	//リソースを使用するインスタンスにリソース情報を設定する	
	[burrierBleOne connectResource:sound];
	[burrierBleTwo connectResource:sound];
	[burrierArray  connectResource:texture];
	[enemyArray    connectResource:texture Sound:sound];
	[effectArray   connectResource:texture];
	//******************************************************************
	//グラッフィクの設定
	[backGround    setGraph:[texture getTextureForKey:@"back_ground_001"]];
	[lifeGauge     setGraph:[texture getTextureForKey:@"life_gauge"]];
	[score         setGraph:[texture getTextureForKey:@"number_001"]];
	
	[beaconOne     setGraph:[texture getTextureForKey:@"target_beacon"]];
	[beaconTwo     setGraph:[texture getTextureForKey:@"target_beacon"]];
	[difenseObject setGraph:[texture getTextureForKey:@"mather_ship"]];
	[burrierBleOne setGraph:[texture getTextureForKey:@"burrierble"]];
	[burrierBleTwo setGraph:[texture getTextureForKey:@"burrierble"]];
	
	return self;
}

- (void)upDateScene
{
	//****************************************************************
	//更新処理
	[stage         upDate];
	[burrierBleOne upDate];
	[beaconOne     upDate];
	[beaconTwo     upDate];
	[enemyArray    upDate];
	[difenseObject upDate];
	//更新処理
	//****************************************************************
	if(lifeGauge.nowAmount <= 0){
		transitionState = CHANGE;
		nextSceneKey = @"gameover";
	}
}

- (void)renderScene
{
	//****************************************************************
	//描画処理
	[backGround    draw];
	[difenseObject draw];
	
	[burrierArray  draw];
	[burrierBleOne draw];
	[burrierBleTwo draw];
	[beaconOne     draw];
	[beaconTwo     draw];
	[enemyArray    draw];
	[effectArray   draw];
	
	[score         draw];
	[lifeGauge     draw];
	//描画処理
	//****************************************************************
}

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	for(UITouch* touch in touches){
		CGPoint toPoint = [touch locationInView:view];
		if([burrierBleOne checkBeginTouch:toPoint]){ break; }
		if([burrierBleTwo checkBeginTouch:toPoint]){ break; }
	}
}

- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	for(UITouch* touch in touches){
		CGPoint nowPoint = [touch locationInView:view];
		CGPoint previousPoint = [touch previousLocationInView:view];
		if(![burrierBleOne checkMoveTouch:nowPoint beforPoint:previousPoint]){
			[burrierBleTwo checkMoveTouch:nowPoint beforPoint:previousPoint];
		}
	}
}

- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	for(UITouch* touch in touches){
		CGPoint nowPoint =      [touch locationInView:view];
		CGPoint previousPoint = [touch previousLocationInView:view];
		[burrierBleOne checkEndTouch:nowPoint beforPoint:previousPoint];
		[burrierBleTwo checkEndTouch:nowPoint beforPoint:previousPoint];
	}
}

- (void)dealloc
{
	//******************************************************************
	//オブジェクト削除   
	[enemyDataBase dealloc];
	[effectArray   dealloc];  
	[mediation     dealloc];  
	
	[stage         dealloc];       
	[backGround    dealloc];  
	[lifeGauge     dealloc]; 
	[score         dealloc]; 
	
	[beaconOne     dealloc];
	[beaconTwo     dealloc];
	[difenseObject dealloc];
	[burrierBleOne dealloc];
	[burrierBleTwo dealloc];
	[burrierArray  dealloc];
	[enemyArray    dealloc];
	
	[super dealloc];
}

@end
