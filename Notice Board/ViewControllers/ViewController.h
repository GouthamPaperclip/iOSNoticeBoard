//
//  ViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 06/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BEMAnalogClockView.h"

@interface ViewController : UIViewController<BEMAnalogClockDelegate, BEMAnimationDelegate>
{
    
    BEMAnalogClockView *clockViewBEMMelbourne;
    BEMAnalogClockView *clockViewBEMIndia;
    
    UILabel *lblMelborneTime;
    UILabel *lblBangaloreTime;
    
    
    IBOutlet UILabel *lblIn;
    IBOutlet UILabel *lblOut;
    IBOutlet UILabel *lblMeeting;
    IBOutlet UILabel *lblTasks;
}

//Check In/Out method
-(IBAction)checkInOutAction:(id)sender;

@end
