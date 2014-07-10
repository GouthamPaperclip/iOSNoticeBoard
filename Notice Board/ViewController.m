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

@synthesize lblIn, lblMeeting, lblOut, lblTasks;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    
    lblIn.text = @"In";
    lblOut.text = @"Out";
    lblMeeting.text = @"Meeting";
    lblTasks.text = @"Tasks";
    
    int xAxis = (1024/2)-(450);
    int yAxis = (768/2)-(225);
    
    UIView *viewForClocks = [[UIView alloc] initWithFrame:CGRectMake(xAxis, yAxis, 900, 500)];
    viewForClocks.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewForClocks];
    
    UIImage *imgClock = [UIImage imageNamed:@"Clock_Background_Black.png"];
    
    //Clock View Melborne
    // We customize the background images of clockViewMelborne and clockViewIndia
    clockViewMelborne = [[ClockView alloc] init];
    clockViewMelborne.frame = CGRectMake(0, 0, imgClock.size.width, imgClock.size.height);
    [clockViewMelborne setClockBackgroundImage:[UIImage imageNamed:@"Clock_Background_Black.png"].CGImage];
	[clockViewMelborne setHourHandImage:[UIImage imageNamed:@"Hour Hand.png"].CGImage];
	[clockViewMelborne setMinHandImage:[UIImage imageNamed:@"Minute Hand.png"].CGImage];
	[clockViewMelborne setSecHandImage:[UIImage imageNamed:@"Second Hand.png"].CGImage];
    //[viewForClocks addSubview:clockViewMelborne];
    [clockViewMelborne startWithMelbourneTime:YES];

    
    clockViewBEM = [[BEMAnalogClockView alloc] init];
    clockViewBEM.frame = CGRectMake(0, 0, imgClock.size.width, imgClock.size.height);
    clockViewBEM.delegate = self;
    clockViewBEM.currentTime = YES;
    clockViewBEM.faceBackgroundColor = [UIColor blackColor];
    clockViewBEM.tag = 1;
    clockViewBEM.realTime = YES;
    [viewForClocks addSubview:clockViewBEM];
    clockViewBEM.minuteHandLength = clockViewBEM.minuteHandLength+60;
    clockViewBEM.hourHandLength = clockViewBEM.hourHandLength+40;
    clockViewBEM.secondHandLength = clockViewBEM.secondHandLength+60;
    [clockViewBEM startRealTime];
    
    //[self analogClock:clockViewBEM graduationColorForIndex:<#(NSInteger)#>];
    
    
    NSString *str = [NSString stringWithFormat:@"Melborne"];
    //CGSize sizeOfFont = [str sizeWithFont:[UIFont fontWithName:@"Futura-Medium" size:40.0]];
    
    UIFont *font = [UIFont fontWithName:@"Futura-Medium" size:40.0];
    CGRect textRect;
    NSDictionary *attributes = @{NSFontAttributeName: font};
    textRect.size = [str sizeWithAttributes:attributes];
    
    UILabel *lblMelborne = [[UILabel alloc] initWithFrame:CGRectMake(120, clockViewMelborne.frame.size.height+clockViewMelborne.frame.origin.y+30, textRect.size.width, textRect.size.height)];
    lblMelborne.text = str;
    lblMelborne.font = font;
    lblMelborne.textAlignment = NSTextAlignmentCenter;
    lblMelborne.textColor = [UIColor whiteColor];
    lblMelborne.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblMelborne];
    
    //Clock View Melborne
    // We customize the background images of clockViewMelborne and clockViewIndia
    clockViewIndia = [[ClockView alloc] init];
    clockViewIndia.frame = CGRectMake(500, 0, imgClock.size.width, imgClock.size.height);
    [clockViewIndia setClockBackgroundImage:[UIImage imageNamed:@"Clock_Background_Black.png"].CGImage];
	[clockViewIndia setHourHandImage:[UIImage imageNamed:@"Hour Hand.png"].CGImage];
	[clockViewIndia setMinHandImage:[UIImage imageNamed:@"Minute Hand.png"].CGImage];
	[clockViewIndia setSecHandImage:[UIImage imageNamed:@"Second Hand.png"].CGImage];
    //[viewForClocks addSubview:clockViewIndia];
    [clockViewIndia startWithMelbourneTime:NO];
    
    str = [NSString stringWithFormat:@"Bangalore"];
    textRect.size = [str sizeWithAttributes:attributes];
    
    UILabel *lblBangalore = [[UILabel alloc] initWithFrame:CGRectMake(620, clockViewIndia.frame.size.height+clockViewIndia.frame.origin.y+30, textRect.size.width, textRect.size.height)];
    lblBangalore.text = str;
    lblBangalore.font = font;
    lblBangalore.textAlignment = NSTextAlignmentCenter;
    lblBangalore.textColor = [UIColor whiteColor];
    lblBangalore.backgroundColor = [UIColor clearColor];
    [viewForClocks addSubview:lblBangalore];
}

#pragma mark - Check In/Out Action Method

-(IBAction)checkInOutAction:(id)sender
{
    NSLog(@"Check in out clicked..");
}

#pragma mark - BEMAnalogClock Code


- (CGFloat)analogClock:(BEMAnalogClockView *)clock graduationLengthForIndex:(NSInteger)index {
    
        if (!(index % 15) == 1) { // Every 5 graduation will be longer.
            return 50;
        }
        else
        {
            
            return 5;
        }
    
    if (!(index % 5) == 1) { // Every 5 graduation will be longer.
        return 20;
    } else {
        return 5;
    }
    
}

//Hello!

- (UIColor *)analogClock:(BEMAnalogClockView *)clock graduationColorForIndex:(NSInteger)index
{
    if (!(index % 15) == 1)
    {
        // Every 15 graduation will be blue.
        return [UIColor whiteColor];
    }
    else
    {
        return [UIColor whiteColor];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
