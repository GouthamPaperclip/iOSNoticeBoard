//
//  ViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 06/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BEMAnalogClockView.h"
#import "PITaskViewController.h"
#import "Reachability.h"

@interface ViewController : UIViewController<BEMAnalogClockDelegate, BEMAnimationDelegate>
{
    //Clock views
    BEMAnalogClockView *clockViewBEMMelbourne;
    BEMAnalogClockView *clockViewBEMIndia;
    
    //Digital time lables under clocks
    UILabel *lblMelborneTime;
    UILabel *lblBangaloreTime;
    
    
    //Top bar labels
    IBOutlet UILabel *lblInTitle;
    IBOutlet UILabel *lblOutTitle;
    IBOutlet UILabel *lblMeetingTitle;
    IBOutlet UILabel *lblTasksTitle;

    IBOutlet UILabel *lblIn;
    IBOutlet UILabel *lblOut;
    IBOutlet UILabel *lblMeeting;
    IBOutlet UILabel *lblTasks;
    
    //Hidden interconnection lable
    IBOutlet UILabel *lblInternetNotAvailable;
    
    //View transparent for indicator and activity indicator
    UIView *viewBackGroundForIndicator;
    UIActivityIndicatorView *activityIndicator;
    
    //Internet reachability
    Reachability *internetReachableFoo;
    
    //Check In/Out Button
    IBOutlet UIButton *btnCheckInOut;
    
    
}

//Check In/Out method
-(IBAction)checkInOutAction:(id)sender;
@end
