//
//  SKSConfiguration.mm
//  SpeechKitSample
//
//  All Nuance Developers configuration parameters can be set here.
//
//  Copyright (c) 2015 Nuance Communications. All rights reserved.
//

#import "SKSConfiguration.h"

// All fields are required.
// Your credentials can be found in your Nuance Developers portal, under "Manage My Apps".
NSString* SKSAppKey = @"7abed36bccbb0d407154cfe500d83b21d14d484b9d0f839ec7dfaab2ef5f5a691d2dd5eae8e22a5a37f93f37d27a58a3c7a0ee65af71037651ad28400c82aa2a";
NSString* SKSAppId = @"NMDPTRIAL_simon_guichard_yahoo_fr20160406091129";
NSString* SKSServerHost = @"sslsandbox.nmdp.nuancemobility.net";
NSString* SKSServerPort = @"443";

NSString* SKSLanguage = @"fr_FR";

NSString* SKSServerUrl = [NSString stringWithFormat:@"nmsps://%@@%@:%@", SKSAppId, SKSServerHost, SKSServerPort];

// Only needed if using NLU/Bolt
NSString* SKSNLUContextTag = @"!NLU_CONTEXT_TAG!";

