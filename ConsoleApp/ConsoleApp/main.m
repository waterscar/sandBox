//
//  main.m
//  ConsoleApp
//
//  Created by Edward Xie on 11-9-10.
//  Copyright 2011年 LeanDev China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Greeter.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    Greeter* myGreeter=[[Greeter alloc] init];
    
    [myGreeter setGreetingText:@"Hello, this is object c strange style code, haha"];
    [myGreeter issueGreeting];
    [myGreeter release];

    [pool drain];
    return 0;
}

