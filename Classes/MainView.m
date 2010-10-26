//
//  MainView.m
//  AnimationTalk
//
//  Created by alexisgo on 10/26/10.
//  Copyright 2010 aut faciam. All rights reserved.
//

#import "MainView.h"


@implementation MainView

- (void)dealloc
{
    if (_path)
        CFRelease(_path);
    [super dealloc];
}

- (void)setPath:(CGPathRef)path
{
    if (path != _path) {
        if (_path)
            CFRelease(_path);
        _path = CFRetain(path);
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    if (!_path)
        return;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);    
    CGContextAddPath(ctx, _path);
    
    CGContextSetLineWidth(ctx, 2);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextDrawPath(ctx, kCGPathStroke);    
}

@end