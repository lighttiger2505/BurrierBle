//
//  TouchBeacon.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"
#import "BurrierBle.h"

@interface TouchBeacon : DrawObj {
	BurrierBle* burrierBle;
}

- (id)init;
- (void)connectObj:(BurrierBle*)setBurrierBle;

- (void)changeRote;
- (void)changeScale;

- (void)upDate;
- (void)draw;
- (void)dealloc;

@end
