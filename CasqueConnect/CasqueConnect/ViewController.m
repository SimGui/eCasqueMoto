//
//  ViewController.m
//  CasqueConnect
//
//  Created by Simon on 06/04/2016.
//  Copyright © 2016 Simon. All rights reserved.
//

#import "ViewController.h"
#import "AppelSecoursController.h"

#import <AVFoundation/AVFoundation.h>

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _callInProgress = NO;
    }
    return self;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake && !self.callInProgress)
    {
        self.callInProgress = YES;
        self.appelController = [[AppelSecoursController alloc] init];
        self.appelController.viewController = self;
        
        [self.appelController demanderPourAppelerLesSecours];
    }
}

@end
