//
//  PIQRCodeReaderViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 10/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface PIQRCodeReaderViewController : UIViewController<ZBarReaderDelegate>
{
    //Working with timer
    NSTimer *timerObj;
    float timeFrame;
}
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImageView;

-(IBAction)predentAction:(id)sender;

@end
