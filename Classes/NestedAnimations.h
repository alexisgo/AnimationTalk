//
//  NestedAnimations.h
//  AnimationTalk
//
//  Created by alexisgo on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface NestedAnimations : UIViewController {
	IBOutlet UIImageView *meiMei;
	IBOutlet UIButton *marchButton;
	
	IBOutlet UILabel *iCanHaz;
	IBOutlet UILabel *allLabel;
	IBOutlet UILabel *urLabel;
	IBOutlet UILabel *baseLabel;
	IBOutlet UILabel *suckahLabel;
	
	NSString *currentLocation;
}

- (IBAction)onButtonPress:(id)sender;
+ (NSString *)friendlyName;

@property (nonatomic, retain) UIImageView *meiMei;
@property (nonatomic, retain) UIButton *marchButton;

@property (nonatomic, retain) NSString *currentLocation;

@property (nonatomic, retain) UILabel *iCanHaz;
@property (nonatomic, retain) UILabel *allLabel;
@property (nonatomic, retain) UILabel *urLabel;
@property (nonatomic, retain) UILabel *baseLabel;
@property (nonatomic, retain) UILabel *suckahLabel;


@end
