//
//  ViewController.m
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 06/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    
    //Calculating the center point for two clock views
    int xAxis = (1024/2)-(450);
    int yAxis = (768/2)-(225);
    
    //A view for clocks
    UIView *viewForClocks = [[UIView alloc] initWithFrame:CGRectMake(xAxis, yAxis, 900, 500)];
    viewForClocks.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewForClocks];
    
    //Adding Melbourne clock on viewForClock
    UIImage *imgClock = [UIImage imageNamed:@"Clock_Background_Black.png"];
    clockViewBEMMelbourne = [[BEMAnalogClockView alloc] init];
    clockViewBEMMelbourne.frame = CGRectMake(0, 0, imgClock.size.width, imgClock.size.height);
    clockViewBEMMelbourne.delegate = self;
    clockViewBEMMelbourne.currentTime = NO;
    clockViewBEMMelbourne.faceBackgroundColor = [UIColor blackColor];
    clockViewBEMMelbourne.tag = 1;
    clockViewBEMMelbourne.realTime = YES;
    clockViewBEMMelbourne.minuteHandLength = clockViewBEMMelbourne.minuteHandLength+100;
    clockViewBEMMelbourne.hourHandLength = clockViewBEMMelbourne.hourHandLength+60;
    clockViewBEMMelbourne.secondHandLength = clockViewBEMMelbourne.secondHandLength+100;
    [clockViewBEMMelbourne startRealTime];
    [viewForClocks addSubview:clockViewBEMMelbourne];
    
    //Updating to melbourne time
    NSDate *currentDate = [[NSDate alloc] init];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH"];
    [dateformatter setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Melbourne"]];
    NSString *strHours = [dateformatter stringFromDate:currentDate];
    [dateformatter setDateFormat:@"mm"];
    NSString *strMinutes = [dateformatter stringFromDate:currentDate];
    [dateformatter setDateFormat:@"ss"];
    NSString *strSeconds = [dateformatter stringFromDate:currentDate];
    
    //Updating Melbourne time on the clock
    clockViewBEMMelbourne.hours = [strHours intValue];
    clockViewBEMMelbourne.minutes = [strMinutes intValue];
    clockViewBEMMelbourne.seconds = [strSeconds intValue];
    [clockViewBEMMelbourne updateTimeAnimated:YES];
    
    
    
    
    //Adding Melourne Digital Time and title under clock
    NSString *str = [NSString stringWithFormat:@"Melborne"];
    UIFont *font = [UIFont fontWithName:@"Futura-Medium" size:35.0];
    CGRect textRect;
    NSDictionary *attributes = @{NSFontAttributeName: font};
    textRect.size = [str sizeWithAttributes:attributes];
    
    UILabel *lblMelborne = [[UILabel alloc] initWithFrame:CGRectMake(130, clockViewBEMMelbourne.frame.size.height+clockViewBEMMelbourne.frame.origin.y+60, textRect.size.width, textRect.size.height)];
    lblMelborne.text = str;
    lblMelborne.font = font;
    lblMelborne.textAlignment = NSTextAlignmentCenter;
    lblMelborne.textColor = [UIColor whiteColor];
    lblMelborne.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblMelborne];
    
    lblMelborneTime = [[UILabel alloc] initWithFrame:CGRectMake(130, clockViewBEMMelbourne.frame.size.height+clockViewBEMMelbourne.frame.origin.y+10, textRect.size.width, textRect.size.height)];
    lblMelborneTime.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
    lblMelborneTime.textAlignment = NSTextAlignmentCenter;
    lblMelborneTime.textColor = [UIColor whiteColor];
    lblMelborneTime.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblMelborneTime];
    
    
    //Adding Bangalore clock
    
    //Adding Bangalore clock on the viewForClock
    clockViewBEMIndia = [[BEMAnalogClockView alloc] init];
    clockViewBEMIndia.frame = CGRectMake(500, 0, imgClock.size.width, imgClock.size.height);
    clockViewBEMIndia.delegate = self;
    clockViewBEMIndia.currentTime = YES;
    clockViewBEMIndia.faceBackgroundColor = [UIColor blackColor];
    clockViewBEMIndia.tag = 2;
    clockViewBEMIndia.realTime = YES;
    clockViewBEMIndia.minuteHandLength = clockViewBEMIndia.minuteHandLength+100;
    clockViewBEMIndia.hourHandLength = clockViewBEMIndia.hourHandLength+60;
    clockViewBEMIndia.secondHandLength = clockViewBEMIndia.secondHandLength+100;
    [clockViewBEMIndia startRealTime];
    [viewForClocks addSubview:clockViewBEMIndia];
    
    //Adding Bangalore Digital Time and title under clock
    str = [NSString stringWithFormat:@"Bangalore"];
    textRect.size = [str sizeWithAttributes:attributes];
    
    UILabel *lblBangalore = [[UILabel alloc] initWithFrame:CGRectMake(630, clockViewBEMIndia.frame.size.height+clockViewBEMIndia.frame.origin.y+60, textRect.size.width, textRect.size.height)];
    lblBangalore.text = str;
    lblBangalore.font = font;
    lblBangalore.textAlignment = NSTextAlignmentCenter;
    lblBangalore.textColor = [UIColor whiteColor];
    lblBangalore.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblBangalore];
    
    lblBangaloreTime = [[UILabel alloc] initWithFrame:CGRectMake(630, clockViewBEMIndia.frame.size.height+clockViewBEMIndia.frame.origin.y+10, textRect.size.width, textRect.size.height)];
    lblBangaloreTime.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
    lblBangaloreTime.textAlignment = NSTextAlignmentCenter;
    lblBangaloreTime.textColor = [UIColor whiteColor];
    lblBangaloreTime.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblBangaloreTime];
}

#pragma mark - Check In/Out Action Method

-(IBAction)checkInOutAction:(id)sender
{
    NSLog(@"Check in out clicked..");
}


#pragma mark - BEMAnalogClock Delegate Methods

- (CGFloat)analogClock:(BEMAnalogClockView *)clock graduationLengthForIndex:(NSInteger)index
{
    if (!(index % 15) == 1)
        return 0;
    else
        return 0;
}


- (UIColor *)analogClock:(BEMAnalogClockView *)clock graduationColorForIndex:(NSInteger)index
{
    if (!(index % 15) == 1)
        return [UIColor clearColor];
    else
        return [UIColor clearColor];
}

- (void)currentTimeOnClock:(BEMAnalogClockView *)clock Hours:(NSString *)hours Minutes:(NSString *)minutes Seconds:(NSString *)seconds
{
    if (clock.tag == 1)
    {
        int hoursInt = [hours intValue];
        int minutesInt = [minutes intValue];
        int secondsInt = [seconds intValue];
        lblMelborneTime.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hoursInt, minutesInt, secondsInt];
    }
    
    if (clock.tag == 2)
    {
        int hoursInt = [hours intValue];
        int minutesInt = [minutes intValue];
        int secondsInt = [seconds intValue];
        lblBangaloreTime.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hoursInt, minutesInt, secondsInt];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
