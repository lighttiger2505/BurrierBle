//
//  DrawShapeUtil.mm
//  BurrierBle
//
//  Created by Ohashi-iPhoneDev on 10/01/13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DrawShapeUtil.h"

void drawSquare(float x, float y, float width, float height, 
				int red, int green, int blue, int alpha)
{
	const GLfloat vertices[] = {
		-width/2 + x, height/2 + y , 0.0,
		width/2 + x , height/2 + y , 0.0,
		-width/2 + x, -height/2 + y, 0.0,
		width/2 + x , -height/2 + y, 0.0
	};
	const GLubyte colors[] = {
		red, green, blue, alpha,
		red, green, blue, alpha,
		red, green, blue, alpha,
		red, green, blue, alpha
	};
	
	glVertexPointer(3, GL_FLOAT, 0, vertices);
	glColorPointer(4, GL_UNSIGNED_BYTE, 0, colors);
	glDrawArrays(GL_TRIANGLES, 0, 4);
}

