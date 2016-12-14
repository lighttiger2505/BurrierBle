//
//  MyTexture.m
//  OGLGame
//
//  Created by Ohashi-iPhoneDev on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TextureManager.h"

@implementation TextureManager

+ (TextureManager*)sharedTextureManager
{ 
	static TextureManager* sharedInstance = nil;
		if (!sharedInstance)
		{
			sharedInstance = [[self alloc] init];
		}
	return sharedInstance;
}

-(id) init{
	[super init];
	array = [[NSMutableDictionary alloc]init];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"ziki_i.png" width:32 heigth:32 flameNum:0] forKey:@"burrierble"];
	[array setObject:[[MyTexture alloc] initWithImage:@"ziki_damage.png" width:32 heigth:32 flameNum:3] forKey:@"burrierble_damage"];
	[array setObject:[[MyTexture alloc] initWithImage:@"bokan_98_e.png" width:98 heigth:98 flameNum:0] forKey:@"mather_ship"];
	[array setObject:[[MyTexture alloc] initWithImage:@"target_beacon.png" width:64 heigth:64 flameNum:0] forKey:@"target_beacon"];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"insekiB.png" width:32 heigth:32 flameNum:0] forKey:@"meteo_blue"];
	[array setObject:[[MyTexture alloc] initWithImage:@"insekiG.png" width:40 heigth:40 flameNum:0] forKey:@"meteo_green"];
	[array setObject:[[MyTexture alloc] initWithImage:@"insekiR.png" width:48 heigth:48 flameNum:0] forKey:@"meteo_red"];
	[array setObject:[[MyTexture alloc] initWithImage:@"teki_B.png" width:32 heigth:32 flameNum:0] forKey:@"enemy_ship_blue"];
	[array setObject:[[MyTexture alloc] initWithImage:@"teki_G.png" width:48 heigth:48 flameNum:0] forKey:@"enemy_ship_green"];
	[array setObject:[[MyTexture alloc] initWithImage:@"teki_R.png" width:64 heigth:64 flameNum:0] forKey:@"enemy_ship_red"];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"reza_b.png" width:32 heigth:32 flameNum:4] forKey:@"burrier_blue"];
	[array setObject:[[MyTexture alloc] initWithImage:@"reza_g.png" width:32 heigth:32 flameNum:4] forKey:@"burrier_green"];
	[array setObject:[[MyTexture alloc] initWithImage:@"reza_r.png" width:32 heigth:32 flameNum:4] forKey:@"burrier_red"];
	[array setObject:[[MyTexture alloc] initWithImage:@"start_reza_b.png" width:32 heigth:32 flameNum:3] forKey:@"start_burrier_blue"];
	[array setObject:[[MyTexture alloc] initWithImage:@"start_reza_g.png" width:32 heigth:32 flameNum:3] forKey:@"start_burrier_green"];
	[array setObject:[[MyTexture alloc] initWithImage:@"start_reza_r.png" width:32 heigth:32 flameNum:3] forKey:@"start_burrier_red"];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"exp_01.png" width:40 heigth:40 flameNum:7] forKey:@"exp_001"];
	[array setObject:[[MyTexture alloc] initWithImage:@"exp_02.png" width:56 heigth:56 flameNum:7] forKey:@"exp_002"];
	[array setObject:[[MyTexture alloc] initWithImage:@"exp_03.png" width:72 heigth:72 flameNum:7] forKey:@"exp_003"];
	[array setObject:[[MyTexture alloc] initWithImage:@"burrier_break_02.png" width:32 heigth:32 flameNum:7] forKey:@"burrier_break"];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"life_gauge_03.png" width:320 heigth:16 flameNum:0] forKey:@"life_gauge"];
	[array setObject:[[MyTexture alloc] initWithImage:@"back_ground.png" width:320 heigth:480 flameNum:0] forKey:@"back_ground_001"];
	[array setObject:[[MyTexture alloc] initWithImage:@"number_01.png" width:16 heigth:32 flameNum:9] forKey:@"number_001"];
	
	[array setObject:[[MyTexture alloc] initWithImage:@"rogo.png" width:512 heigth:333 flameNum:0] forKey:@"title_rogo"];
	[array setObject:[[MyTexture alloc] initWithImage:@"tap_start.png" width:170 heigth:50 flameNum:0] forKey:@"tap_start_font"];
	[array setObject:[[MyTexture alloc] initWithImage:@"gameover.png" width:270 heigth:80 flameNum:0] forKey:@"game_over_font"];

	return self;
}

- (void)drawForKey:(NSString*)textureID 
		 drawPoint:(CGPoint)point 
			 flame:(int)flame 
			 angle:(float)angle 
			 scale:(float)scale 
			 alpha:(float)alpha
{
	MyTexture* drawObj = [array objectForKey:textureID];
	[drawObj drawAtPoint:point flame:flame angle:angle scale:scale alpha:alpha];
}

- (MyTexture*)getTextureForKey:(NSString*)TextureID
{
	return [array objectForKey:TextureID];
}

- (int)getFlameForKey :(int)TextureID{
	MyTexture *drawObj = [array objectForKey:[NSNumber numberWithInt:TextureID]];
	return [drawObj getFlameNum];
}



- (void)dealloc{
	[array release];
	[super dealloc];
}

@end
