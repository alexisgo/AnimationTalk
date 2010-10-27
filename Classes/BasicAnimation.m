    //
//  BasicAnimation.m
//  AnimationTalk
//
//  Created by alexisgo on 10/25/10.
//  Copyright 2010 aut faciam. All rights reserved.
//

#import "BasicAnimation.h"


@implementation BasicAnimation

+ (NSString *)friendlyName {
	return @"CABasicAnimation (opacity)";
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView *myView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	myView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"floorSmall.png"]];
	
	
	meiTheCat = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meiInTank.png"]];
	meiTheCat.frame = CGRectMake(10, 60, 100, 100);
	[myView addSubview:meiTheCat];	
		
	UIButton *fadeInButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	fadeInButton.frame = CGRectMake(10, 10, 100, 44);
	[fadeInButton setTitle:@"Fade In" forState:UIControlStateNormal];
	[fadeInButton addTarget:self action:@selector(fadeIn:) forControlEvents:UIControlEventTouchUpInside];
	[myView addSubview:fadeInButton];
	
	UIButton *fadeOutButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	fadeOutButton.frame = CGRectMake(210, 10, 100, 44);
	[fadeOutButton setTitle:@"Fade Out" forState:UIControlStateNormal];
	[fadeOutButton addTarget:self action:@selector(fadeOut:) forControlEvents:UIControlEventTouchUpInside];
	[myView addSubview:fadeOutButton];
	
	self.view = myView;
		
}

#pragma mark Event Handlers


- (void)fadeIn:(id)sender 
{
	CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];

	// setting the opacity here ensures the layer doesn't disappear after the animation is over
	[meiTheCat.layer setOpacity:1];

	// when changing the model value, you must use BOTH a fromValue and a toValue
	myAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	myAnimation.toValue = [NSNumber numberWithFloat:1.0];
	myAnimation.duration = 2.0;
	myAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	
	[meiTheCat.layer addAnimation:myAnimation forKey:@"myAnimation"];	

}

- (void)fadeOut:(id)sender 
{
	CABasicAnimation *myAnimationFadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];

	// change the model value
	// this ensures the layer doesn't RE-appear after the animation is over
	[meiTheCat.layer setOpacity:0];

	// when changing the model value, you must use BOTH a fromValue and a toValue
	myAnimationFadeOut.fromValue = [NSNumber numberWithFloat:1.0];	
	myAnimationFadeOut.toValue = [NSNumber numberWithFloat:0.0];
	myAnimationFadeOut.duration = 2.0;
	myAnimationFadeOut.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	
	[meiTheCat.layer addAnimation:myAnimationFadeOut forKey:@"myAnimationFadeOut"];
	

}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
