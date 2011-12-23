//
//  BCView.m
//  noiseBackground
//
//  Created by xu lian on 11-11-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BCView.h"
#import "NSImage+BCExtension.h"

@implementation BCView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setGrain:0.035];
        self.backgroundColor=[NSColor colorWithDeviceRed:185/255.0 green:190/255.0 blue:197/255.0 alpha:1];
    }    
    return self;
}

- (void)awakeFromNib
{
    [self setGrain:0.035];
    self.backgroundColor=[NSColor colorWithDeviceRed:185/255.0 green:190/255.0 blue:197/255.0 alpha:1];
}

- (void)dealloc
{
    CGImageRelease(noisePattern);
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

- (float)grain
{
    return grain;
}

- (void)setGrain:(float)agrain
{
    CGImageRelease(noisePattern);
    noisePattern = [NSImage createNoiseImageRefWithWidth:128 height:128 factor:agrain];
    [self setNeedsDisplay:YES];
}

- (NSColor*)backgroundColor
{
    return backgroundColor;
}

- (void)setBackgroundColor:(NSColor *)newBackgroundColor
{
    if (backgroundColor!=newBackgroundColor) {
#if __has_feature(objc_arc)
        backgroundColornewBackgroundColor;
#else
        [backgroundColor release];
        backgroundColor=[newBackgroundColor retain];
#endif
        [self setNeedsDisplay:YES];
    }
}
- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [backgroundColor set];
    NSRectFill(self.bounds);
    
    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation:NSCompositePlusLighter];
    CGRect noisePatternRect = CGRectZero;
    noisePatternRect.size = CGSizeMake(CGImageGetWidth(noisePattern), CGImageGetHeight(noisePattern));        
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextDrawTiledImage(context, noisePatternRect, noisePattern);
    [NSGraphicsContext restoreGraphicsState];
}

@end
