//
//  AppDelegate.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/17/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "AppDelegate.h"
#import "TabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(209/255.0) green:(34/255.0) blue:(39/255.0) alpha:1]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    // initialise main UI window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Create TabViewController instance
    TabViewController *mainTabView = [[TabViewController alloc] init];
    
    // set mainTabView to be the root view
    self.window.rootViewController = mainTabView;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
