//
//  EnemyData.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@interface EnemyData : NSObject {
	NSString* graphId;
	NSString* downEffect;
	int durability;
	int attakPower;
	int getScore;
	int hitRange;
}

- (id)init :(NSString*)setGraphId 
 DownEffect:(NSString*)setDownEffect 
 Durability:(int)setDurability 
 AttakPower:(int)setAttakPower 
   GetScore:(int)setGetScore
   hitRange:(int)setHitRange;

- (void)dealloc;

@property(readonly) NSString* graphId;
@property(readonly) NSString* downEffect;
@property(readonly) int durability;
@property(readonly) int attakPower;
@property(readonly) int getScore;
@property(readonly) int hitRange;

@end
