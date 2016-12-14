//
//  EnemyDataBase.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EnemyData.h"

@interface EnemyDataBase : NSObject {
	NSMutableDictionary* array;
}

- (id)init;

- (EnemyData*)getData :(NSString*)enemyId;

- (void)dealloc;

@end
