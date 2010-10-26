    //
//  StickyNote.m
//  AnimationTalk
//
//  Created by alexisgo on 10/25/10.
//  Copyright 2010 aut faciam. All rights reserved.
//

#import "StickyNote.h"


@implementation StickyNote

@synthesize stickyNote;

+ (NSString *)friendlyName {
	return @"trasitionWithView (CurlUp)";
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		self.title = @"Sticky Note";
    }
    return self;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	UIView *myView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	stickyNote = [[UIView alloc] init];
	stickyNote.frame = CGRectMake(30, 100, 250, 200);
	stickyNote.backgroundColor = [UIColor purpleColor];
	[myView addSubview:stickyNote];
		
	UIButton *button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	button.frame = CGRectMake(100, 310, 100, 44);
	[button setTitle:@"Curl Up" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(curl:) forControlEvents:UIControlEventTouchUpInside];
	[myView addSubview:button];
	
	self.view = myView;
}

-(void)curl:(id) sender
{
	
	[UIView transitionWithView:stickyNote 
					  duration:2.0 
					   options:UIViewAnimationOptionTransitionCurlUp
					animations:nil
					completion:nil];



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
	
	[stickyNote release];
}


@end
