    //
//  SetAlpha.m
//  AnimationTalk
//
//  Created by alexisgo on 10/22/10.
//  Copyright 2010 aut faciam. All rights reserved.
//

#import "SetAlpha.h"
#import <QuartzCore/QuartzCore.h>

@implementation SetAlpha

@synthesize meiMei;

+ (NSString *)friendlyName {
	return @"Fade In and Out";
}

-(void) loadView
{
	UIView *myView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	myView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"floorSmall.png"]];
	
	meiMei = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meiInTank.png"]];
	meiMei.frame = CGRectMake(10, 60, 100, 100);
	meiMei.alpha = 0.0;
	[myView addSubview:meiMei];

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
	[UIView animateWithDuration:1.0 animations:^
	{
		[meiMei setAlpha:1.0];	
	}];
}

- (void)fadeOut:(id)sender 
{
	[UIView animateWithDuration:1.0 animations:^
	 {
		 [meiMei setAlpha:0.0];	
	 }];
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
