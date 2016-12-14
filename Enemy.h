//
//  Enemy.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"
#import "EnemyData.h"

#import "SoundManager.h"

#import "Score.h"
#import "DifenseObject.h"
#import "EffectArray.h"
#import "HitMediation.h"
#import "Hit.h"

@interface Enemy : DrawObj {
	NSString* downEffect;
	float xSpeed;
	float ySpeed;
	int   durability;
	int   attakPower;
	int   getScore;
	bool  flag;
	
	Hit*           hit;
	
	SoundManager*  sound;
	
	Score*         score;
	DifenseObject* difenseObject;
	EffectArray*   effect;
}

- (id)init;
- (void)upDate;

- (void)setting:(EnemyData*)setEnemyData 
	   location:(CGPoint)setPoint 
		 xSpeed:(float)setXSpeed 
		 ySpeed:(float)setYSpeed; 
- (void)connectObj:(DifenseObject*)setDifenseObject 
			Effect:(EffectArray*)setEffect 
			 Score:(Score*)setScore;
- (void)connectResource:(SoundManager*)setSound;

- (bool)getFlag;
- (void)judgmentHit :(Hit*)atkHit mediation:(HitMediation*)mediation;
- (void)crackDown;
- (void)hitTarget;

- (void)move;
- (void)checkOutScreen;

- (void)dealloc;
@end
