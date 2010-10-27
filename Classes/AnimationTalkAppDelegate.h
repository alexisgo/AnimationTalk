//
//  AnimationTalkAppDelegate.h
//  AnimationTalk
//
//  Created by alexisgo on 10/22/10.
//  Copyright 2010 aut faciam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetOpacity.h"
#import "CABasics.h"
#import "StickyNote.h"
#import "RootViewController.h"

@interface AnimationTalkAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

