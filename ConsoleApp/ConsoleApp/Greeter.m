//
//  Greeter.m
//  ConsoleApp
//
//  Created by Edward Xie on 11-9-10.
//  Copyright 2011年 LeanDev China. All rights reserved.
//

#import "Greeter.h"

@implementation Greeter

- (NSString *)greetingText
{
    return greetingText;
}

- (void) setGreetingText:(NSString *)newText{
    [newText retain];
    [greetingText release];
    greetingText=newText;
}

- (void) issueGreeting
{
    NSLog(@"%@",[self greetingText]);
}

- (void) dealloc
{
    [greetingText release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
