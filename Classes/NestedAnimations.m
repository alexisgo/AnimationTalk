//
//  NestedAnimations.m
//  AnimationTalk
//
//  Created by alexisgo on 10/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NestedAnimations.h"


@implementation NestedAnimations

@synthesize meiMei, marchButton, iCanHaz, urLabel, allLabel, baseLabel, suckahLabel, currentLocation;


+ (NSString *)friendlyName {
	return @"Nested Animations";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"floorSmall.png"]];
	currentLocation = @"TopLeft";

	iCanHaz.alpha = 0.0;
	allLabel.alpha = 0.0;
	urLabel.alpha = 0.0; 
	baseLabel.alpha = 0.0;
	suckahLabel.alpha = 0.0;
	
}

- (IBAction)onButtonPress:(id)sender
{	
	if (currentLocation == @"TopLeft")
	{
		// move cat sprite
		[UIView animateWithDuration:1.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ meiMei.center = CGPointMake(280, 90); }
						 completion:^(BOOL finished) {
		
							//unhide the label once the cat has moved
							[UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
											 animations:^{ iCanHaz.alpha = 1.0; }
											 completion:NULL];
						 
						 }];
		currentLocation = @"TopRight";
	}
	else if (currentLocation == @"TopRight")
	{
		// move cat sprite
		[UIView animateWithDuration:1.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ meiMei.center = CGPointMake(280, 300); }
						 completion:^(BOOL finished) {
							 
							// unhide the two labels, one after the other, after the cat sprite has moved
							[UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
											 animations:^{ allLabel.alpha = 1.0; }
											 completion:^(BOOL finished) 
											 { 
												 [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
																  animations:^{ urLabel.alpha = 1.0; }
																  completion:NULL]; 
											 }];
						 }];
		currentLocation = @"BottomRight";
		
	}
	else if (currentLocation == @"BottomRight")
	{
		// move cat sprite
		[UIView animateWithDuration:1.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ meiMei.center = CGPointMake(90, 300); }
						 completion:^(BOOL finished) {
							 
						[UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
										 animations:^{ baseLabel.alpha = 1.0; }
										 completion:NULL];
						 }];
		currentLocation = @"BottomLeft";
	}
	else {
		// move cat sprite
		[UIView animateWithDuration:1.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
						 animations:^{ meiMei.center = CGPointMake(50, 100); }
						 completion:^(BOOL finished) {
							 
							[UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut 
											 animations:^{ suckahLabel.alpha = 1.0; }
											 completion:^(BOOL finished){
												 [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseOut 
																  animations:^{ 
																	  iCanHaz.alpha = 0.0;
																	  allLabel.alpha = 0.0;
																	  urLabel.alpha = 0.0; 
																	  baseLabel.alpha = 0.0;
																	  suckahLabel.alpha = 0.0;
																  }
																  completion:NULL]; 
												 
											 }];
						 }];
		currentLocation = @"TopLeft";
	}
	
	
	
	
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
