//
//  EnemyArray.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"
#import "EnemyDataBase.h"

#import "TextureManager.h"
#import "SoundManager.h"

#import "Score.h"
#import "DifenseObject.h"
#import "EffectArray.h"
#import "HitMediation.h"

#define ENEMY_MAX_NUM 50

@interface EnemyArray : NSObject {
	Enemy* array[ENEMY_MAX_NUM];
	int lastReference;
	
	TextureManager* texture;
	SoundManager*  sound;
	
	Score*         score;
	DifenseObject* difenseObject;
	HitMediation*  mediation;
	EnemyDataBase* enemyDataBase;
	EffectArray*   effect;
}

- (id)init;
- (void)connectObj :(EnemyDataBase*)setEnemyDataBase 
	   TargetObject:(DifenseObject*)setDifenseObject
			 Effect:(EffectArray*  )setEffectArray 
		  Mediation:(HitMediation* )setMediation 
		  GameScore:(Score*        )setScore;
- (void)connectResource:(TextureManager*)setTexture 
				  Sound:(SoundManager*)setSound;

- (void)add:(NSString*)enemyId 
setLocation:(CGPoint)setLocation 
	 XSpeed:(float)setXSpeed 
	 YSpeed:(float)setYSpeed;

- (void)upDate;
- (int)empty;

- (void)judgmentHit :(Hit*)atkHit;

- (void)draw;
- (void)dealloc;

@end
