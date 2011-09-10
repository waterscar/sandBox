//
//  DragPen.m
//  WhiteBoard
//
//  Created by 田力 毕 on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DragPen.h"

@implementation DragPen

@synthesize fillColor;
@synthesize strokeColor;
@synthesize penWidth;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.fillColor = [UIColor blackColor];
        self.strokeColor = [UIColor blackColor];
        self.penWidth = 1.f;
    }
    
    return self;
}

- (void)dealloc
{
    [self.fillColor release];
    [self.strokeColor release];
    [super dealloc];
}

@end


@implementation DragPath

@synthesize path;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.path = [UIBezierPath bezierPath];
        pen = [[DragPen alloc] init];
        [pen retain];
    }
    return self;
}

- (void)dealloc
{
    [self.path release];
    [pen release];
    [super dealloc];
}

- (void)setStrokeColor:(UIColor *)color
{
    pen.strokeColor = color;
}

- (void)setFillColor:(UIColor *)color
{
    pen.fillColor = color;
}

- (void)fill
{
    [pen.fillColor setFill];
    [path fill];
}

- (void)stroke
{
    [pen.strokeColor setStroke];
    path.lineWidth = pen.penWidth;
    [path stroke];
}

- (void)moveToPoint:(CGPoint)point
{
    [path moveToPoint:point];
}

- (void)addLineToPoint:(CGPoint)point
{
    [path addLineToPoint:point];
}

- (void)copyPen:(DragPen *)another
{
    assert(another);
    pen.strokeColor = another.strokeColor;
    pen.fillColor = another.fillColor;
    pen.penWidth = another.penWidth;
}
@end