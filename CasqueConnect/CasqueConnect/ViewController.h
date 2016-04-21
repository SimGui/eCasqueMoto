//
//  ViewController.h
//  CasqueConnect
//
//  Created by Simon on 06/04/2016.
//  Copyright © 2016 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppelSecoursController.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) AppelSecoursController *appelController;
@property (weak, nonatomic) IBOutlet UIButton *profileBtn;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;
@property (weak, nonatomic) IBOutlet UIButton *contratBtn;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UILabel *instructionLbl;

@end

