/*
 
 SampleManager.m
 
 Modified by aut faciam and Alexis Goldstein from 
 Free Time Studios and Nathan Eror
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

#import "SampleManager.h"
#import <objc/runtime.h>
#import "SetOpacity.h"
#import "StickyNote.h"
#import "BasicAnimation.h"
#import "ChangePosition.h"
#import "ShadowPath.h"
#import "KeyFrame.h"
#import "FlipTransition.h"
#import "SetCenter.h"
#import "SetTransform.h"
#import "NestedAnimations.h"

@interface UIViewController (ThisIsHereToAviodACompilerWarning)

+ (NSString *)friendlyName;

@end

@implementation SampleManager

- (id)init {
  self = [super init];
  if (self != nil) {
    NSArray *uiKit = [NSArray arrayWithObjects:[SetOpacity class], [UIKitChangePosition class], 
					  [SetTransform class], [StickyNote class], [FlipTransition class], 
					  [NestedAnimations class], nil];
    NSArray *caImplicit = [NSArray arrayWithObjects: [ChangePosition class], [ShadowPath class], nil];
    NSArray *caExplicit = [NSArray arrayWithObjects:[BasicAnimation class], [KeyFrame class], nil];
    
    
    groups_ = [[NSArray alloc] initWithObjects:@"UIView Animations",
                                               @"CA Implicit",
                                               @"CA Explicit",
                                               nil];
    
    samples_ = [[NSArray alloc] initWithObjects:uiKit, caImplicit, caExplicit, nil]; 
  }
  return self;
}


- (NSUInteger)groupCount {
  return [groups_ count];
}

- (NSUInteger)sampleCountForGroup:(NSUInteger)group {
  return [[samples_ objectAtIndex:group] count];
}

- (NSArray *)samplesForGroup:(NSUInteger)group {
  return [[[samples_ objectAtIndex:group] copy] autorelease];
}

- (NSString *)sampleNameAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *samples = [samples_ objectAtIndex:indexPath.section];
  Class clazz = [samples objectAtIndex:indexPath.row];
  return [clazz friendlyName];
}

- (UIViewController *)sampleForIndexPath:(NSIndexPath *)indexPath {
  NSArray *samples = [samples_ objectAtIndex:indexPath.section];
  Class clazz = [samples objectAtIndex:indexPath.row];
  UIViewController *instance = [[clazz alloc] initWithNibName:nil bundle:nil];
  return [instance autorelease];
}

- (NSString *)groupTitleAtIndex:(NSUInteger)index {
 return [[[groups_ objectAtIndex:index] copy] autorelease];
}

@end
