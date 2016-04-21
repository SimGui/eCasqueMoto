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

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        _profileBtn.tintColor = [UIColor whiteColor];
    }
    return self;
}

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

- (IBAction)clickBtnOui:(id)sender
{
    [self.appelController reponseOui];
}

- (IBAction)clickBtnNon:(id)sender
{
    [self.appelController reponseNon];
}


- (IBAction)clickOnPlayBtn:(id)sender
{
    self.playBtn.hidden = YES;
    self.stopButton.hidden = NO;
    self.instructionLbl.text = @"Détéction de chute activée";
}

- (IBAction)clickOnStopBtn:(id)sender
{
    self.playBtn.hidden = NO;
    self.stopButton.hidden = YES;
    self.instructionLbl.text = @"Détéction de chute desactivée";
}

@end
