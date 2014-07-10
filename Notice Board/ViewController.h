//
//  ViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 06/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ClockView.h"
#import "BEMAnalogClockView.h"

@interface ViewController : UIViewController<BEMAnalogClockDelegate, BEMAnimationDelegate>
{
    ClockView *clockViewMelborne;
    ClockView *clockViewIndia;
    
    BEMAnalogClockView *clockViewBEM;
}

//Labels Screen savers
@property(nonatomic,strong) IBOutlet UILabel *lblMeeting;
@property(nonatomic,strong) IBOutlet UILabel *lblTasks;
@property(nonatomic,strong) IBOutlet UILabel *lblIn;
@property(nonatomic,strong) IBOutlet UILabel *lblOut;


//Check In/Out method

-(IBAction)checkInOutAction:(id)sender;

@end
