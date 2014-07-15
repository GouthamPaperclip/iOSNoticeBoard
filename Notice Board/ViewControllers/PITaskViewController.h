//
//  PITaskViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 11/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PIQRCodeReaderViewController"

#import "BEMAnalogClockView.h"

@class PIQRCodeReaderViewController;

@interface PITaskViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, BEMAnalogClockDelegate, BEMAnimationDelegate>
{
    IBOutlet UIView *viewUsers;
    IBOutlet UIView *viewMenuBar;
    
    //Table view objects
    IBOutlet UITableView *tableViewTasks;
    IBOutlet UITableView *tableViewUsers;
    
    //Array that contains
    NSMutableArray *arrayItem;
    
    NSMutableArray *aryUsersLogedIn;
    
    //Working with timer
    NSTimer *timerObj;
    float timeFrame;
    
    //Clock views
    IBOutlet BEMAnalogClockView *clockViewMelbourneTaskVC;
    IBOutlet BEMAnalogClockView *clockViewIndiaTaskVC;
    
    //Digital time lables under clocks
    IBOutlet UILabel *lblMelborneTime;
    IBOutlet UILabel *lblBangaloreTime;
}

-(IBAction)checkInOutEvent:(id)sender;

@end
