//
//  Level.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Level : NSObject {
	int first;
	int last;
}

- (id)init :(int)setFirst last:(int)setLast;
- (bool)checkRange :(int)val;
- (void)dealloc;

@end
