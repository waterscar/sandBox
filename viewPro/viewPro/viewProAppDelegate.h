//
//  viewProAppDelegate.h
//  viewPro
//
//  Created by Edward Xie on 11-9-8.
//  Copyright 2011年 LeanDev China. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface viewProAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
