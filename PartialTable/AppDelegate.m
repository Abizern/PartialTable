//
//  PartialTableAppDelegate.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//



#import "AppDelegate.h"

NSString *randomString();

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

// Mark: -
// Mark: Convenience functions

NSString *randomString() {
    // Returns a random string made up of the first 13 characters of a UUID
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuidStringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
        
    NSRange aRange = NSMakeRange(0, 13); // Substring to the second hyphen
    NSString *randomString = [(NSString *)uuidStringRef substringWithRange:aRange];
    
    CFRelease(uuidRef);
    CFRelease(uuidStringRef);
    
    return randomString;
}

@end
