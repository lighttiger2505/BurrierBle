//
//  Stage.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RandomEnemyGeneration.h"

#import "EnemyArray.h"

#import "Calculation.h"

@interface Stage : NSObject {
	NSMutableArray* randomEvent;
	int             timeLine;
	
	EnemyArray* enemy;
}

- (id)init;
- (void)connectObj:(EnemyArray*)setEnemy;

- (void)countTimeLine;
- (void)randomGeneration;
- (void)upDate;

- (void)dealloc;
@end
