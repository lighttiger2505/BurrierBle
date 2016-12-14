//
//  TitleScene.h
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AbstrustScene.h"
#import "DrawObj.h"

@interface TitleScene : AbstrustScene {
	DrawObj* backGround;
	DrawObj* titleImage;
	DrawObj* tapStartImage;
}

- (id)init;
- (void)upDateScene;
- (void)renderScene;

- (void)dealloc;

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;
- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view;

@end
