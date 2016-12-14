//
//  BurrierArray.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TextureManager.h"
#import "EnemyArray.h"
#import "EffectArray.h"

#import "Burrier.h"
#import "BurrierHit.h"
#import "LevelArray.h"

#import "Calculation.h"
#include <math.h>


#define	BURRIER_DRAW_MAX_NUM 30
#define BURRIER_HIT_MAX_NUM  80

@interface BurrierArray : NSObject {
	Burrier*    drawArray[BURRIER_DRAW_MAX_NUM];
	BurrierHit* hitArray[BURRIER_HIT_MAX_NUM];
	LevelArray* level;
	
	TextureManager* textureList;
	EnemyArray*  enemyArray;
	EffectArray* effect;
}

- (id)init;
- (void)connectObj :(EnemyArray*)setEnemyArray effect:(EffectArray*)setEffect;
- (void)connectResource:(TextureManager*)setTexture;

- (void)clear;
- (void)movement :(CGPoint)bOnePoint :(CGPoint)bTwoPoint;
- (void)burrierBreak;

- (void)judgmentHit;

- (void)draw;
- (void)dealloc;

@end
