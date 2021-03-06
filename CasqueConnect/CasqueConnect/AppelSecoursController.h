//
//  AppelSecoursController.h
//  CasqueConnect
//
//  Created by Simon on 06/04/2016.
//  Copyright © 2016 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <SpeechKit/SKTransaction.h>
#import <SpeechKit/SpeechKit.h>

@interface AppelSecoursController : NSObject <AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) SKTransaction *transaction;
@property (strong, nonatomic) SKSession *skSession;
@property (nonatomic) int nbTentative;
@property (strong, nonatomic) NSString *urlToCall;
@property (nonatomic) BOOL callInProgress;

- (void)demanderPourAppelerLesSecours;
- (void)reponseOui;
- (void)reponseNon;


@end
