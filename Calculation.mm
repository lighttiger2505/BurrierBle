/*
 *  Calculation.mm
 *  BurrierBle
 *
 *  Created by Ohashi-iPhoneDev on 09/12/31.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#include "Calculation.h"

//ラジアンから角度への変換
float ConversionAngle(float radian){
	return radian * 180 / M_PI;
}

//角度からラジアンへの変換
float ConversionRadian(float angle){
	return angle / 180 * M_PI;
}

//距離を計算
float Distance(float myX, float myY, float targetX, float targetY){
	float range =  sqrt((myX - targetX)*(myX - targetX)+(myY - targetY)*(myY - targetY));
	return range;
}

float RadianForDistance(float myX, float myY, float targetX, float targetY)
{
	const float xDifference = targetX - myX;
	const float yDifference = targetY - myY;
	const float angle = atan2(xDifference, yDifference);
	return angle;
}

float AngleForDistance(float myX, float myY, float targetX, float targetY){
	float radian = RadianForDistance(myX, myY, targetX, targetY);
	ConversionAngle(radian);
	return radian;
}

float SnipX(float myX, float targetX, float range, float speed){
	return (myX - targetX) / range * speed;
}

float SnipY(float myY, float targetY, float range, float speed){
	return (myY - targetY) / range * speed;
}


