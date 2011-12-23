//
//  AppDelegate.m
//  noiseBackground
//
//  Created by xu lian on 11-11-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;

- (void)dealloc
{
#if !__has_feature(objc_arc)
    [super dealloc];    
#endif
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
