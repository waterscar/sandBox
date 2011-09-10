//
//  WhiteBoardView.h
//  WhiteBoard
//
//  Created by 田力 毕 on 11-9-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSArray.h>
#import "DragPen.h"

@interface WhiteBoardView : UIView
{
@protected
    NSMutableArray* pathArray;
    //UIBezierPath*   curPath;
    DragPath*       curPath;
    DragPen*        curPen;
}
/*
@property (nonatomic, retain) NSMutableArray*   pathArray;
//@property (nonatomic, retain) UIBezierPath*     curPath;
@property (nonatomic, retain) DragPath*         curPath;
@property (nonatomic, retain) DragPen*          curPen;
*/
@end
