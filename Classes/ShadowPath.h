//
//  ShadowPath.h
//  AnimationTalk
//
//  Created by alexisgo on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ShadowPath : UIViewController {
	CALayer *imageLayer;

}

+ (NSString *)friendlyName;
- (void) moveWithShadow:(id) sender;

@end
