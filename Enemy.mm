//
//  Enemy.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

- (id)init
{
	[super init];
	flag = false;
	hit = [[Hit alloc]init];
	return self;
}

- (void)upDate
{
	[self move];
	[self checkOutScreen];
	if([difenseObject judgmentHit:location damage:attakPower]){
		[self hitTarget];
	}
}

- (void)setting :(EnemyData*)setEnemyData 
		location:(CGPoint)setPoint 
		  xSpeed:(float)setXSpeed 
		  ySpeed:(float)setYSpeed 
{
	[super init];
	
	[super setLocation:setPoint];
	xSpeed = setXSpeed;
	ySpeed = setYSpeed;
	durability = setEnemyData.durability;
	attakPower = setEnemyData.attakPower;
	getScore   = setEnemyData.getScore;
	downEffect = setEnemyData.downEffect;
	flag = true;
	
	[hit setting:setEnemyData.hitRange];
}

- (void)connectObj:(DifenseObject*)setDifenseObject 
			Effect:(EffectArray*)setEffect 
			 Score:(Score*)setScore;
{
	difenseObject = setDifenseObject;
	effect =        setEffect;
	score  =        setScore;
}

- (void)connectResource:(SoundManager*)setSound
{
	sound = setSound;
}

- (bool)getFlag
{
	return flag;
}

- (void)judgmentHit :(Hit*)atkHit mediation:(HitMediation*)mediation
{
	hit.myPoint = location;
	if([hit judgment:atkHit]){
		if(atkHit.attackPawer >= durability){
			[self crackDown];
		}
		else{
			[mediation HitResult:1];
		}
	}
}

- (void)crackDown
{
	[effect add:location GraphID:downEffect angle:0.0f scale:1.0f alpha:0.85f];
	[sound playSoundWithKey:@"bom_001" gain:0.45f pitch:1.0f location:Vector2fZero shouldLoop:NO];
	[score upScore:getScore];
	flag = false;
}

- (void)hitTarget
{
	[sound playSoundWithKey:@"bom_003" gain:0.45f pitch:1.0f location:Vector2fZero shouldLoop:NO];
	flag = false;
}

- (void)move
{
	location.x += xSpeed;
	location.y += ySpeed;
}

- (void)checkOutScreen
{
	if(location.x < -100){
		flag = false;
	}
	if(location.x > 420){
		flag = false;
	}
	if(location.y < -100){
		flag = false;
	}
	if(location.y > 580){
		flag = false;
	}
}

- (void)dealloc
{
	[hit release];
	[super dealloc];
}

@end
