//
//  DragPen.h
//  WhiteBoard
//
//  Created by 田力 毕 on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DragPen : NSObject
{
    UIColor*    fillColor;
    UIColor*    strokeColor;
    float       penWidth;
}

@property (nonatomic, retain)   UIColor*  fillColor;
@property (nonatomic, retain)   UIColor*  strokeColor;
@property (nonatomic)           float     penWidth;

@end

@interface DragPath : NSObject
{
@public
    UIBezierPath*   path;
@protected
    DragPen*        pen;    // further may be changed to index of pen table
}

@property (nonatomic, retain)   UIBezierPath* path;

- (void)setStrokeColor:(UIColor*)color;
- (void)setFillColor:(UIColor*)color;
- (void)fill;
- (void)stroke;
- (void)moveToPoint:(CGPoint)point;
- (void)addLineToPoint:(CGPoint)point;
- (void)copyPen:(DragPen*)another;

@end