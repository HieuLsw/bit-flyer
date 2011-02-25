//
//  bitFlyerAppDelegate.h
//  bitFlyer
//
//  Created by Christopher V. Ingebrigtsen on 2/24/11.
//  Copyright Tap Me! Inc 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface bitFlyerAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
