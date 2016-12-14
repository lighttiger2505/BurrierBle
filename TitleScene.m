//
//  TitleScene.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TitleScene.h"


@implementation TitleScene

- (id)init
{
	[super init];
	backGround = [[DrawObj alloc] init];
	[backGround setGraph:[texture getTextureForKey:@"back_ground_001"]];
	[backGround setLocation:CGPointMake(160.0f, 240.0f)];
	
	titleImage = [[DrawObj alloc] init];
	[titleImage setGraph:[texture getTextureForKey:@"title_rogo"]];
	[titleImage setScale:0.5f];
	[titleImage setLocation:CGPointMake(160.0f,180.0f)];
	
	tapStartImage = [[DrawObj alloc] init];
	[tapStartImage setGraph:[texture getTextureForKey:@"tap_start_font"]];
	[tapStartImage setAlpha:0.0f];
	[tapStartImage setLocation:CGPointMake(160.0f,360.0f)];
	return self;
}

- (void)upDateScene
{
	static float bottanAlpha = 0.0f;
	static BOOL feadFlag = YES;
	if(feadFlag){
		bottanAlpha += 0.02f;
		if(bottanAlpha >= 1.0f){
			feadFlag = NO;
		}
	}else{
		bottanAlpha -= 0.02f;
		if(bottanAlpha <= 0.0f){
			feadFlag = YES;
		}
	}
	[tapStartImage setAlpha:bottanAlpha];
}

- (void)renderScene
{
	[backGround draw];
	[titleImage draw];
	[tapStartImage draw];
}

- (void)dealloc
{
	[texture release];
	[sound   release];
	[super dealloc];
}

- (void)upDateTouchesBegin:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	transitionState = CHANGE;
	nextSceneKey = @"gameplay";
}

- (void)upDateTouchesMove:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	
}

- (void)upDateTouchesEnd:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView*)view
{
	
}


@end
