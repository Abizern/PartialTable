//
//  PartialTableAppDelegate.h
//  PartialTable
//
//  Created by Abizer Nasir on 07/07/2011.
//

#import <UIKit/UIKit.h>

@class TableViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    TableViewController *tableViewController;
}

@property (nonatomic) IBOutlet UIWindow *window;

@end
