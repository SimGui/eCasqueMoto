//
//  AppelSecoursController.m
//  CasqueConnect
//
//  Created by Simon on 06/04/2016.
//  Copyright © 2016 Simon. All rights reserved.
//

#import "AppelSecoursController.h"
#import "SKSConfiguration.h"

@interface AppelSecoursController()<SKTransactionDelegate>

@end

@implementation AppelSecoursController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transaction = nil;
        _skSession = nil;
        _nbTentative = 0;
        _urlToCall = @"http://plimot.azurewebsites.net/Api/Vocal/GetAppelSecours?longitude=2.2216172&latitude=48.8965725";
    }
    return self;
}

- (void)demanderPourAppelerLesSecours
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Souhaitez-vous que les secours interviennent ?"];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    
    [syn speakUtterance:utterance];
}

- (void)confirmerAppelSecours
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Les secours ont été prévenu!"];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    
    [syn speakUtterance:utterance];
    self.callInProgress = NO;
}

- (void)annulerAppelSecours
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Les secours n'ont pas été prévenu!"];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    
    [syn speakUtterance:utterance];
    self.callInProgress = NO;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    [self p_startTransaction];
}

- (void)transaction:(SKTransaction *)transaction didReceiveRecognition:(SKRecognition *)recognition
{
    NSString *response = [NSString stringWithFormat:@"%@", [recognition text]];
    
    if([response isEqualToString:@"Oui"])
    {
        [self p_envoyerInformationClient];
    }
    else if(![response isEqualToString:@"Non"] && self.nbTentative < 2)
    {
        [self demanderPourAppelerLesSecours];
    }
    else if(self.nbTentative >= 2)
    {
        [self p_envoyerInformationClient];
    }
    else
    {
        [self annulerAppelSecours];
    }
}

- (void)transaction:(SKTransaction *)transaction didFailWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    [self demanderPourAppelerLesSecours];
}

- (void)reponseOui
{
    [self p_envoyerInformationClient];
}

- (void)reponseNon
{
    [self annulerAppelSecours];
}
#pragma mark - Private Methods

- (void) p_startTransaction
{
    self.skSession= [[SKSession alloc] initWithURL:[NSURL URLWithString:SKSServerUrl] appToken:SKSAppKey];
    
    self.transaction = [self.skSession recognizeWithType:SKTransactionSpeechTypeDictation
                                               detection:SKTransactionEndOfSpeechDetectionShort
                                                language:@"fr_FR"
                                                delegate:self];
    
    self.nbTentative++;
}

- (void) p_envoyerInformationClient
{
    NSURL *url = [NSURL URLWithString:self.urlToCall];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    [self confirmerAppelSecours];
    self.nbTentative = 0;
    self.callInProgress = NO;
}

@end
