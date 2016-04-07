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

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake && !self.appelController.callInProgress)
    {
        self.appelController = [[AppelSecoursController alloc] init];
        self.appelController.callInProgress = YES;
        
        [self.appelController demanderPourAppelerLesSecours];
    }
}

@end
