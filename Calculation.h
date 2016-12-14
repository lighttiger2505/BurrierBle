/*
 *  Calculation.h
 *  BurrierBle
 *
 *  Created by Ohashi-iPhoneDev on 09/12/31.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#include <math.h>

float ConversionAngle(float radian);
float ConversionRadian(float angle);
float Distance(float myX, float myY, float targetX, float targetY);
float RadianForDistance(float myX, float myY, float targetX, float targetY);
float AngleForDistance(float myX, float myY, float targetX, float targetY);
float SnipX(float myX, float targetX, float range, float speed);
float SnipY(float myY, float targetY, float range, float speed);