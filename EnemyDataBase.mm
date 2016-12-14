//
//  EnemyDataBase.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EnemyDataBase.h"


@implementation EnemyDataBase

- (id)init
{
	[super init];
	array = [[NSMutableDictionary alloc] init];
	[array setObject:[[EnemyData alloc] init:@"meteo_blue" DownEffect:@"exp_001" Durability:1 AttakPower:2 GetScore:10 hitRange:12] forKey:@"meteo_blue"];
	[array setObject:[[EnemyData alloc] init:@"meteo_green" DownEffect:@"exp_002" Durability:2 AttakPower:5 GetScore:100 hitRange:18] forKey:@"meteo_green"];
	[array setObject:[[EnemyData alloc] init:@"meteo_red" DownEffect:@"exp_003" Durability:3 AttakPower:10 GetScore:500 hitRange:20] forKey:@"meteo_red"];
	[array setObject:[[EnemyData alloc] init:@"enemy_ship_blue" DownEffect:@"exp_001" Durability:1 AttakPower:3 GetScore:20 hitRange:12] forKey:@"ship_blue"];
	[array setObject:[[EnemyData alloc] init:@"enemy_ship_green" DownEffect:@"exp_002" Durability:2 AttakPower:8 GetScore:200 hitRange:18] forKey:@"ship_green"];
	[array setObject:[[EnemyData alloc] init:@"enemy_ship_red" DownEffect:@"exp_003" Durability:3 AttakPower:15 GetScore:2000 hitRange:20] forKey:@"ship_red"];

	return self;
}

- (EnemyData*)getData :(NSString*)enemyId
{
	EnemyData* tempEnemy = [array objectForKey:enemyId];
	return tempEnemy;
}

- (void)dealloc
{
	[array dealloc];
	[super dealloc];
}

@end
