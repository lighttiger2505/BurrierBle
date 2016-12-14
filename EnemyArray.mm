//
//  EnemyArray.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EnemyArray.h"


@implementation EnemyArray

- (id)init
{
	[super init];
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		array[i] = [[Enemy alloc] init];
	}
	lastReference = 0;
	return self;
}

- (void)connectObj :(EnemyDataBase*)setEnemyDataBase 
	   TargetObject:(DifenseObject*)setDifenseObject
			 Effect:(EffectArray*  )setEffectArray 
		  Mediation:(HitMediation* )setMediation 
		  GameScore:(Score*        )setScore;
{
	enemyDataBase = setEnemyDataBase;
	difenseObject = setDifenseObject;
	effect        = setEffectArray;
	mediation     = setMediation;
	score         = setScore;
}

- (void)connectResource:(TextureManager*)setTexture 
				  Sound:(SoundManager*)setSound

{
	texture = setTexture;
	sound = setSound;
}

- (void)add:(NSString*)enemyId 
setLocation:(CGPoint)setLocation 
	 XSpeed:(float)setXSpeed 
	 YSpeed:(float)setYSpeed
{
	const int emptyNumber = [self empty];
	const EnemyData* setEnemyDataBase = [enemyDataBase getData:enemyId];
	//敵の情報を設定
	[array[emptyNumber] setting:
	 [enemyDataBase getData:enemyId] 
	 location:setLocation 
	 xSpeed:setXSpeed 
	 ySpeed:setYSpeed];
	//関係オブジェクトとの接続
	[array[emptyNumber] connectObj:difenseObject Effect:effect Score:score];
	[array[emptyNumber] connectResource:sound];
	//グラフィックを設定
	[array[emptyNumber] setGraph:[texture getTextureForKey:setEnemyDataBase.graphId]];
}

- (void)upDate
{
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		if([array[i] getFlag]){
			[array[i] upDate];
		}
	}
}

- (int)empty
{
	for(int i = lastReference; i < ENEMY_MAX_NUM; i++){
		if(![array[i] getFlag]){
			lastReference = i + 1;
			return i;
		}
	}
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		if(![array[i] getFlag]){
			lastReference = i + 1;
			return i;
		}
	}
	return 0;
}

- (void)draw
{
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		if([array[i] getFlag]){
			[array[i] draw];
		}
	}
}

- (void)judgmentHit :(Hit*)atkHit
{
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		if([array[i] getFlag]){
			[array[i] judgmentHit:atkHit mediation:mediation];
		}
	}
}

- (void)dealloc
{
	for(int i = 0; i < ENEMY_MAX_NUM; i++){
		[array[i] release];
	}
	[super dealloc];
}

@end
