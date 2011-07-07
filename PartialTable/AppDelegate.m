//
//  PartialTableAppDelegate.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

#import "AppDelegate.h"

@implementation AppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [_window release];
    [super dealloc];
}

@end
