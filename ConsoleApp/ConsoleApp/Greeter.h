//
//  Greeter.h
//  ConsoleApp
//
//  Created by Edward Xie on 11-9-10.
//  Copyright 2011年 LeanDev China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Greeter : NSObject
{
    NSString *greetingText;
}

-(NSString*) greetingText;
-(void)setGreetingText:(NSString*) newText;
-(void)issueGreeting;

@end
