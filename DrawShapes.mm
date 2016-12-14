/*
 *  graphUtill.mm
 *  BurrierBle
 *
 *  Created by Ohashi-iPhoneDev on 09/12/26.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#include "DrawShapes.h"

void drawLine(CGPoint start, CGPoint end)
{
	static const GLfloat squareVertices[] = {
		start.x, start.y,
		end.x, end.y,
    };
	
	const GLubyte squareColors[] = {
		255, 255, 255, 255,
		255, 255, 255, 255,
	};
	
	glVertexPointer(2, GL_FLOAT, 0, squareVertices);
    glEnableClientState(GL_VERTEX_ARRAY);
    glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
    glEnableClientState(GL_COLOR_ARRAY);
	
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glDisableClientState(GL_VERTEX_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);
}

void drawSquare(float x, float y, float width, float height, int red, int green, int blue, int alpha)
{
	static const GLfloat squareVertices[] = {
		 width/2 + x, height/2 + y,
		 -width/2 + x, height/2 + y,
		 width/2 + x, -height/2 + y,
		 -width/2 + x, -height/2 + y,
    };
	
	const GLubyte squareColors[] = {
		red, green, blue, alpha,
		red, green, blue, alpha,
		red, green, blue, alpha,
		red, green, blue, alpha,
	};
	
	glVertexPointer(2, GL_FLOAT, 0, squareVertices);
    glEnableClientState(GL_VERTEX_ARRAY);
    glColorPointer(4, GL_UNSIGNED_BYTE, 0, squareColors);
    glEnableClientState(GL_COLOR_ARRAY);

    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glDisableClientState(GL_VERTEX_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);
}

void drawCircle(float x, float y, int divides, float radius, int red, int green, int blue, int alpha)
{
	GLfloat vertices[divides * 3 * 2];
	
	int vertexId = 0;
	for(int i = 0; i<divides; i++){
		//i番目の頂点の角度を計算
		float theta1 = 2.0f / (float)divides * (float)i * M_PI;
		float theta2 = 2.0f / (float)divides * (float)(i+1) * M_PI;
		//描画の始点を設定
		vertices[vertexId++] = x;
		vertices[vertexId++] = y;
		//頂点情報を計算して格納
		vertices[vertexId++] = cos(theta1) * radius + x;
		vertices[vertexId++] = sin(theta1) * radius + y;
		vertices[vertexId++] = cos(theta2) * radius + x;
		vertices[vertexId++] = sin(theta2) * radius + y;
	}
	//色の格納
	glColor4ub(red, green, blue, alpha);
	glDisableClientState(GL_COLOR_ARRAY);
	//頂点配列をセットして、ポリゴンを描画
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glEnableClientState(GL_VERTEX_ARRAY);
	//頂点の数として"divides * 3"を指定
	glDrawArrays(GL_TRIANGLES, 0, divides * 3);
}



