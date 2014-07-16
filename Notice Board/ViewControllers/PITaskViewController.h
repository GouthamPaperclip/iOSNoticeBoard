//
//  PITaskViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 11/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUPView.h"

#import "BEMAnalogClockView.h"

@class PIQRCodeReaderViewController;

@interface PITaskViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, BEMAnalogClockDelegate, BEMAnimationDelegate, UIPopoverControllerDelegate, PopUPViewDelegate>
{
    IBOutlet UIView *viewUsers;
    IBOutlet UIView *viewMenuBar;
    
    //Table view objects
    IBOutlet UITableView *tableViewTasks;
    IBOutlet UITableView *tableViewUsers;
    IBOutlet UITableView *tableViewUsersOut;
    
    //Array that contains
    NSMutableArray *aryUsersLogedIn;
    NSMutableArray *aryUsersLogedOut;
    NSMutableArray *aryTaskDetailsList;
    
    //Working with timer
    NSTimer *timerObj;
    float timeFrame;
    
    //Clock views
    IBOutlet BEMAnalogClockView *clockViewMelbourneTaskVC;
    IBOutlet BEMAnalogClockView *clockViewIndiaTaskVC;
    
    //Digital time lables under clocks
    IBOutlet UILabel *lblMelborneTime;
    IBOutlet UILabel *lblBangaloreTime;
    
    //Flip work
    BOOL didFlip;
    IBOutlet UIView *viewForFlip;
    IBOutlet UIView *viewFlipForTable;
    IBOutlet UIView *viewAfterFlip;
    
    //Popover Object
    UIPopoverController *popOverController;
    PopUPView *popUpViewCheckInHistory;
}

-(IBAction)checkInOutEvent:(id)sender;

@end