//
//  Score.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawObj.h"

@interface Score : DrawObj {
	int number;
	int digit;
}

- (id)init:(CGPoint)setLocation Digit:(int)setDigit;
- (void)upScore:(int)val;
- (void)draw;
- (void)dealloc;

@end
