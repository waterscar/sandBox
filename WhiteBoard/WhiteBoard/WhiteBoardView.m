//
//  WhiteBoardView.m
//  WhiteBoard
//
//  Created by 田力 毕 on 11-9-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "WhiteBoardView.h"

@implementation WhiteBoardView
/*
@synthesize pathArray;
@synthesize curPath;
@synthesize curPen;
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        pathArray = [NSMutableArray array];
        curPen = [[DragPen alloc] init];
    }
    return self;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        pathArray = [NSMutableArray array];
        curPen = [[DragPen alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        pathArray = [NSMutableArray array];
        curPen = [[DragPen alloc] init];
        
        [pathArray retain];
        [curPen retain];
    }
    return self;
}

- (void)dealloc
{
    [curPath release];
    [curPen release];
    NSEnumerator* iterator = [pathArray objectEnumerator];
    UIBezierPath *path = nil;
    while (path = [iterator nextObject])
        [path release];
    [pathArray release];
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if ([pathArray count] != 0)
    {
        NSEnumerator* iterator = [pathArray objectEnumerator];
        //UIBezierPath* path;
        id path;
        while (path = [iterator nextObject])
        {
            //[path fill];
            [path stroke];
        }    
    }
    
    if (curPath != [pathArray lastObject])
    {
        //[self.curPath fill];
        [curPath stroke];
    }
}

// Handles the start of a touch
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSUInteger numTaps = [[touches anyObject] tapCount];
    if (numTaps != 1)
    {
        NSLog(@"It only supports one tap.");
        return;
    }
    
    curPath = [[DragPath alloc] init];
    //[curPath setStrokeColor:curPen.strokeColor];
    //[curPath setStrokeColor:[UIColor redColor]];
    [curPath copyPen:curPen];
    
	// Enumerate through all the touch objects.
	for (UITouch *touch in touches)
    {
        [curPath moveToPoint:[touch locationInView:self]];
	}	
    [self setNeedsDisplay];
}

// Handles the continuation of a touch.
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
    //assert(curPath);
	// Enumerates through all touch objects
	for (UITouch *touch in touches)
    {
		[curPath addLineToPoint:[touch locationInView:self]];
	}
    [self setNeedsDisplay];
}

// Handles the end of a touch event.
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Enumerates through all touch object
	for (UITouch *touch in touches)
    {
		[curPath addLineToPoint:[touch locationInView:self]];
	}
    [self setNeedsDisplay];
    [pathArray addObject:curPath];
    [curPath release];
}

@end
