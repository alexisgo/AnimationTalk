//
//  ChangePosition.m
//  AnimationTalk
//
//  Created by alexisgo on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChangePosition.h"

#define X_END  220
#define X_START 50
#define Y 200



@implementation ChangePosition

+ (NSString *)friendlyName {
	return @"Change Layer Position";
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	imageLayer = [[CALayer layer] retain];
	imageLayer.bounds = CGRectMake(10, 10, 100, 100);
	imageLayer.position = CGPointMake(X_START, Y);

	imageLayer.contents = (id)[[UIImage imageNamed:@"meiInTank.png"] CGImage]; 
	
	[self.view.layer addSublayer:imageLayer];

}

- (IBAction) move: (id) sender
{
	if (imageLayer.position.x < X_END)
	{
		imageLayer.position = CGPointMake(X_END, Y);		
	}
	else 
	{
		imageLayer.position = CGPointMake(X_START, Y);
	}

}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	
	[imageLayer release];
}


@end
