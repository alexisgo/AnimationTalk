//
//  KeyFrame.m
//  AnimationTalk
//
//  Created by alexisgo on 10/26/10.
//  Copyright 2010 aut faciam. All rights reserved.
//
// This sample creates a CAKeyframeAnimation by setting the values array
// It also allows you to see the difference between turing on / off
// the calculationMode kCAAnimationCubic

#import "KeyFrame.h"



@implementation KeyFrame

@synthesize spriteLayer;

+ (NSString *)friendlyName {
	return @"Keyframe";
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	spriteLayer = [CALayer layer];
	spriteLayer.bounds = CGRectMake(0, 0, 40, 40);
	spriteLayer.position = CGPointMake(point1.frame.origin.x, point1.frame.origin.y);

	spriteLayer.contents = (id)[[UIImage imageNamed:@"meiInTank.png"] CGImage];
	
	[self.view.layer addSublayer:spriteLayer];
	
	
}

-(IBAction) connectTheDots:(id)sender
{
			
	// create an array of NSValues, which contain the CGPoints of the four UIView dots
	NSArray *valuesArray = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:point1.frame.origin],
							[NSValue valueWithCGPoint:point2.frame.origin],
							[NSValue valueWithCGPoint:point3.frame.origin],
							[NSValue valueWithCGPoint:point4.frame.origin], nil];
	
	CAKeyframeAnimation *connectAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	connectAnimation.values = valuesArray;
	connectAnimation.duration = 2.0;
	connectAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	connectAnimation.delegate = self; 
	
	if (cubicSwitch.on)
	{
		connectAnimation.calculationMode = kCAAnimationCubic;		
	}
		
	[spriteLayer addAnimation:connectAnimation forKey:@"connectDots"];
	
	
	
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
