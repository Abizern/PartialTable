//
//  PartialTableAppDelegate.m
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

static NSUInteger kNumberOfItems = 35;

#import "AppDelegate.h"
#import "TableViewController.h"

NSString *randomString();

@implementation AppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Create 30 items of random data to display in the table view.
    NSMutableArray *itemsArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfItems];
    
    for (NSUInteger idx = 0; idx < kNumberOfItems; idx++) {
        [itemsArray addObject:randomString()];
    }
    
    tableViewController = [[TableViewController alloc] init];
    tableViewController.items = itemsArray;
    
    [self.window setRootViewController:tableViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}


// Mark: -
// Mark: Convenience functions

NSString *randomString() {
    // Returns a random string made up of the first 13 characters of a UUID
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuidStringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
        
    NSRange aRange = NSMakeRange(0, 13); // Substring to the second hyphen
    NSString *randomString = [(__bridge_transfer NSString *)uuidStringRef substringWithRange:aRange];
    
    CFRelease(uuidRef);
    
    return randomString;
}

@end
