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

#pragma mark - Controller Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self desginTheScreen];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNetworkChange:) name:kReachabilityChangedNotification object:nil];
    
    internetReachableFoo = [Reachability reachabilityForInternetConnection];
    [internetReachableFoo startNotifier];
    
    NetworkStatus remoteHostStatus = [internetReachableFoo currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        NSLog(@"no");
        
        [lblInTitle setHidden:YES];
        [lblOutTitle setHidden:YES];
        [lblMeetingTitle setHidden:YES];
        [lblTasksTitle setHidden:YES];
        
        [lblIn setHidden:YES];
        [lblOut setHidden:YES];
        [lblMeeting setHidden:YES];
        [lblTasks setHidden:YES];
        
        [lblInternetNotAvailable setHidden:NO];
        lblInternetNotAvailable.text = @"Internet Connection Not Available";
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    {
        NSLog(@"wifi");
        
        [self sendTheRequest];
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        NSLog(@"cell");
        
        [self sendTheRequest];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    //[internetReachableFoo stopNotifier];
}

-(void)desginTheScreen
{
    // Do any additional setup after loading the view, typically from a nib.
    
    //Calculating the center point for two clock views
    int xAxis = (1024/2)-(450);
    int yAxis = (768/2)-(225);
    
    //A view for clocks
    UIView *viewForClocks = [[UIView alloc] initWithFrame:CGRectMake(xAxis, yAxis, 900, 500)];
    viewForClocks.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewForClocks];
    
    //Adding Melbourne clock on viewForClock
    CGRect imgClock = CGRectMake(0, 0, 400, 400);
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
    clockViewBEMMelbourne.secondHandColor = [UIColor colorWithRed:121/255.0 green:236/255.0 blue:253/255.0 alpha:1.0];//121 236 253
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
    clockViewBEMIndia.secondHandColor = [UIColor colorWithRed:121/255.0 green:236/255.0 blue:253/255.0 alpha:1.0];//121 236 253
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
    
    viewBackGroundForIndicator = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    viewBackGroundForIndicator.backgroundColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:0.9];
    //[self.view addSubview:viewBackGroundForIndicator];
    
    activityIndicator = [[UIActivityIndicatorView alloc] init];
    activityIndicator.color = [UIColor whiteColor];
    activityIndicator.frame = CGRectMake(512-200, (768/2)-200, 400, 400);
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    //    [viewBackGroundForIndicator addSubview:activityIndicator];
    //    [activityIndicator startAnimating];
}

#pragma mark - Send the request

-(void)sendTheRequest
{
    // Send a synchronous request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://j2ktracker.com.au/mobiroster/index.php?mode=init"]];
//    NSURLResponse * response = nil;
//    NSError * error = nil;
//    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
//                                          returningResponse:&response
//                                                      error:&error];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        NSMutableDictionary *dictRecived = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(dictRecived.count == 0 || dictRecived == nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [lblInTitle setHidden:YES];
                [lblOutTitle setHidden:YES];
                [lblMeetingTitle setHidden:YES];
                [lblTasksTitle setHidden:YES];
                
                [lblIn setHidden:YES];
                [lblOut setHidden:YES];
                [lblMeeting setHidden:YES];
                [lblTasks setHidden:YES];
                
                [lblInternetNotAvailable setHidden:NO];
                lblInternetNotAvailable.text = @"Service is down temporarily";
                
            });
        }
        else
        {
            if([[dictRecived valueForKey:@"status"] isEqualToString:@"success"])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [viewBackGroundForIndicator removeFromSuperview];
                    [activityIndicator stopAnimating];
                    
                    
                    [lblInTitle setHidden:NO];
                    [lblOutTitle setHidden:NO];
                    [lblMeetingTitle setHidden:NO];
                    [lblTasksTitle setHidden:NO];
                    
                    [lblIn setHidden:NO];
                    [lblOut setHidden:NO];
                    [lblMeeting setHidden:NO];
                    [lblTasks setHidden:NO];
                    
                    [lblInternetNotAvailable setHidden:YES];
                    
                });
                
                NSLog(@"dict Recived: %@",dictRecived);
            }
            else
            {
                
            }
        }
    }];
    
    //[self desginTheScreen];
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

#pragma mark - Check for internet connection

- (void)handleNetworkChange:(NSNotification *)notice
{
    NetworkStatus remoteHostStatus = [internetReachableFoo currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable)
    {
        NSLog(@"no");
        
        [lblInTitle setHidden:YES];
        [lblOutTitle setHidden:YES];
        [lblMeetingTitle setHidden:YES];
        [lblTasksTitle setHidden:YES];
        
        [lblIn setHidden:YES];
        [lblOut setHidden:YES];
        [lblMeeting setHidden:YES];
        [lblTasks setHidden:YES];
        
        [lblInternetNotAvailable setHidden:NO];
        lblInternetNotAvailable.text = @"Internet Connection Not Available";
    }
    else if (remoteHostStatus == ReachableViaWiFi)
    {
        NSLog(@"wifi");
        
        [self sendTheRequest];
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        NSLog(@"cell");
        
        [self sendTheRequest];
    }
}

-(void)dealloc
{
    [NSNotificationCenter dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
