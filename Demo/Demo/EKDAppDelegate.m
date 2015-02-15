//
//  EKDAppDelegate.m
//  Demo
//
//  Created by Phillip Caudell on 15/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDAppDelegate.h"
#import "EKDRootViewController.h"

@implementation EKDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[EKDRootViewController new]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
