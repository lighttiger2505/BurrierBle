//
//  LevelArray.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"

@interface LevelArray : NSObject {
	NSMutableArray* array;
}

- (id)init;
- (int)getLevel :(int)val;
- (void)dealloc;

@end
