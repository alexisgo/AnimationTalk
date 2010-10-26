    //
//  CABasics.m
//  AnimationTalk
//
//  Created by alexisgo on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CABasics.h"


@implementation CABasics

+ (NSString *)friendlyName {
	return @"CABasics";
}


- (id)initWithTab {
	self.title = @"CA Basics";
	return self;
}

-(void)loadView
{
	UIView *myView = [[[NSBundle mainBundle] loadNibNamed:@"AllYourBase" owner:self options:nil] lastObject];
	myView.backgroundColor = [UIColor whiteColor];
	
	marchButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	marchButton.frame = CGRectMake(10, 10, 150, 40);
	[marchButton setTitle:@"Attack!" forState:UIControlStateNormal];
	[marchButton addTarget:self action:@selector(onButtonPress:) forControlEvents:UIControlEventTouchUpInside];
	[myView addSubview:marchButton];
	
	meiMei = [CALayer layer];  
	meiMei.bounds = CGRectMake(0,0, 70.0, 70.0);  // this is w/ respect to the parent’s coords
	meiMei.position = CGPointMake(30.0, 90.0);
	
	// easiest way to create a layer is to assign an image to the layer’s content
	meiMei.contents = (id)[[UIImage imageNamed:@"meiInTank.png"] CGImage]; 
	[myView.layer addSublayer: meiMei];
	
	iCanHaz = (UILabel*) [myView viewWithTag:27];
	allLabel = (UILabel*) [myView viewWithTag:28];
	urLabel = (UILabel*) [myView viewWithTag:29];
	baseLabel = (UILabel*) [myView viewWithTag:30];
	suckahLabel = (UILabel*) [myView viewWithTag:31];
	
	self.view = myView;
	
}



// this is implicit animation; all we're doing is changing propertiesr
- (void)onButtonPress:(id)sender
{
	CGPoint currentPosition = meiMei.position;
	CGPoint moveToPosition = CGPointMake(30, 90);
	
	if (currentPosition.x == 30 && currentPosition.y == 90)
	{
		moveToPosition = CGPointMake(280.0, 90.0);	
		// UIKit animation, using blocks. iOS 4.0+ only!
		[UIView animateWithDuration:0.5 delay:1.2 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ iCanHaz.alpha = 1.0; }
						 completion:NULL];
	}
	else if (currentPosition.x == 280 && currentPosition.y == 90)
	{
		moveToPosition = CGPointMake(280.0, 300.0);				
		[UIView animateWithDuration:0.25 delay:.75 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ allLabel.alpha = 1.0; }
						 completion:^(BOOL finished) 
							{ 
							 [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut 
									 animations:^{ urLabel.alpha = 1.0; }
									 completion:NULL]; 
							}];
		
	}
	else if (currentPosition.x == 280 && currentPosition.y == 300)
	{
		moveToPosition = CGPointMake(90.0, 300.0);		
		[UIView animateWithDuration:0.5 delay:1.2 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ baseLabel.alpha = 1.0; }
						 completion:NULL];
	}
	else {
		[UIView animateWithDuration:0.5 delay:1.2 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ suckahLabel.alpha = 1.0; }
						 completion:^(BOOL finished){
								[UIView animateWithDuration:0.3 delay:1.5 options:UIViewAnimationOptionCurveEaseOut 
									  animations:^{ 
										  iCanHaz.alpha = 0.0;
										  allLabel.alpha = 0.0;
										  urLabel.alpha = 0.0; 
										  baseLabel.alpha = 0.0;
										  suckahLabel.alpha = 0.0;
									  }
									  completion:NULL]; 
							 
						 }];
	}



	[CATransaction setAnimationDuration:1.75];
	[CATransaction setAnimationTimingFunction: [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];	
	meiMei.position = moveToPosition;
	
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
