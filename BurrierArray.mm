//
//  BurrierArray.m
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BurrierArray.h"

@implementation BurrierArray

- (id)init{
	[super init];
	//事前に発生するバリアの数分のインスタンスを生成
	for(int i = 0; i < BURRIER_DRAW_MAX_NUM; i++){
		drawArray[i] = [[Burrier alloc] init];
	}
	//バリアのあたり判定配列を生成
	for(int j = 0; j < BURRIER_HIT_MAX_NUM; j++){
		hitArray[j] = [[BurrierHit alloc] init];
	}
	//レベル判別用クラスを生成
	level = [[LevelArray alloc]init];
	return self;
}

- (void)connectObj :(EnemyArray*)setEnemyArray effect:(EffectArray*)setEffect{
	enemyArray = setEnemyArray;
	effect = setEffect;
}

- (void)connectResource:(TextureManager*)setTexture
{
	textureList = setTexture;
}

- (void)clear{
	for(int i = 0; i < BURRIER_DRAW_MAX_NUM; i++){
		[drawArray[i] clear];
	}
	for(int j = 0; j < BURRIER_HIT_MAX_NUM; j++){
		[hitArray[j] clear];
	}
}

//レベルから表示するグラフィックのIDを取得。暫定処理
- (MyTexture*)getMainGraph :(float)range{
	int burrierLevel = [level getLevel:range];
	if(burrierLevel == 1){ return [textureList getTextureForKey:@"burrier_blue"]; }
	if(burrierLevel == 2){ return [textureList getTextureForKey:@"burrier_green"]; }
	if(burrierLevel == 3){ return [textureList getTextureForKey:@"burrier_red"]; }
	return nil;
}

//レベルから表示するグラフィックのIDを取得。暫定処理
- (MyTexture*)getStartGraph :(float)range{
	int burrierLevel = [level getLevel:range];
	if(burrierLevel == 1){ return [textureList getTextureForKey:@"start_burrier_blue"]; }
	if(burrierLevel == 2){ return [textureList getTextureForKey:@"start_burrier_green"]; }
	if(burrierLevel == 3){ return [textureList getTextureForKey:@"start_burrier_red"]; }
	return nil;
}

- (void)drawMake :(CGPoint)bOnePoint BTwoPoint:(CGPoint)bTwoPoint tRange:(float)range Angle:(float)angle
{
	//連結させるバリアの個数
	const int burrierNum = (int)range / 32 + 1;
	const int burrierStartRange = ((int)range % 32) / 2;
	//バリア間のステップ計算
	const float stepX = SnipX(bTwoPoint.x, bOnePoint.x, range, 32.0f);
	const float stepY = SnipY(bTwoPoint.y, bOnePoint.y, range, 32.0f);
	const float startX = bOnePoint.x + SnipX(bTwoPoint.x, bOnePoint.x, range, burrierStartRange);
	const float startY = bOnePoint.y + SnipY(bTwoPoint.y, bOnePoint.y, range, burrierStartRange);
	//バリアブルの距離から発生させるバリアのレベルを決定
	MyTexture* mainGraph = [self getMainGraph:range];
	//バリアを少しずつずらしながら対のバリアブルに向かって作成する
	int i;
	for(i = 0; i < burrierNum; i++){
		[drawArray[i] setting:CGPointMake(startX + i * stepX, startY + i * stepY) angle:ConversionAngle(angle)];
		[drawArray[i] setGraph:mainGraph];
	}
	//バリア開始点のグラフィックをセット
	MyTexture* startGraph = [self getStartGraph:range];
	[drawArray[i+1] setting :bOnePoint angle:ConversionAngle(angle)];
	[drawArray[i+1] setGraph:startGraph];
	[drawArray[i+2] setting :bTwoPoint angle:ConversionAngle(angle)+180.0f];
	[drawArray[i+2] setGraph:startGraph];

}

- (void)hitMake  :(CGPoint)bOnePoint Range:(float)range Angle:(float)angle
{
	//連結させるバリアの個数
	const int burrierNum = (int)range / 10;
	//バリア間のステップ計算
	const float xStep = 10 * sin(angle);
	const float yStep = 10 * cos(angle);
	//バリアを少しずつずらしながら対のバリアブルに向かって作成する
	for(int i = 0; i < burrierNum; i++){
		[hitArray[i] setting:CGPointMake(bOnePoint.x + i * xStep, bOnePoint.y + i *yStep) power:[level getLevel:range]];
	}
}

- (void)movement :(CGPoint)bOnePoint :(CGPoint)bTwoPoint{
	//バリアを初期化
	[self clear];
	//片方のバリアブルを始点に対のバリアブルへの角度を計算
	const float angle = RadianForDistance(bOnePoint.x, 
										  bOnePoint.y, 
										  bTwoPoint.x,
										  bTwoPoint.y);
	//バリア発生の開始位置を計算
	const float startX = 24.0f * sin(angle);
	const float startY = 24.0f * cos(angle);
	CGPoint startPoint = CGPointMake(bOnePoint.x + startX, bOnePoint.y + startY);
	CGPoint endPoint   = CGPointMake(bTwoPoint.x - startX, bTwoPoint.y - startY);
	//バリアブル間の距離を計算
	const float range = Distance(startPoint.x, 
								 startPoint.y, 
								 endPoint.x, 
								 endPoint.y);
	//バリア描画を作成
	[self drawMake:startPoint BTwoPoint:endPoint tRange:range Angle:angle];
	//バリアあたり判定を作成
	[self hitMake:startPoint Range:range Angle:angle];
	//当たり判定を実行
	[self judgmentHit];
}

- (void)burrierBreak
{
	for(int i = 0; i < BURRIER_DRAW_MAX_NUM; i++){
		if(drawArray[i].flag){
			[effect add:drawArray[i].location GraphID:@"burrier_break" angle:drawArray[i].angle+90 scale:1.0f alpha:0.85f];
		}
	}
}

- (void)judgmentHit
{
	for(int i = 0; i < BURRIER_HIT_MAX_NUM; i++){
		if(hitArray[i].flag){
			[hitArray[i] judgmentHit: enemyArray];
		}
	}
}

- (void)draw
	{
	for(int i = 0; i < BURRIER_DRAW_MAX_NUM; i++){
		if(drawArray[i].flag){
			[drawArray[i] draw];
		}
	}
}

- (void)dealloc{
	for (int i = 0; i < BURRIER_DRAW_MAX_NUM; i++) {
		[drawArray[i] release];
	}
	for(int j = 0; j < BURRIER_HIT_MAX_NUM; j++){
		[hitArray[j] release];
	}
	[level release];
	[super dealloc];
}

@end
