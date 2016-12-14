//
//  HitMediation.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@interface HitMediation : NSObject {
	bool breakFlag;
}

- (id)init;

//- (void)connectObj:(BurrierBle*)setbOne 
//				    :(BurrierBle*)setbTwo;

- (void)HitResult:(int)result;

- (void)upDate;
- (void)dealloc;

@property(readwrite)bool breakFlag;

@end
