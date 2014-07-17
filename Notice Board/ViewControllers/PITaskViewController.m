//
//  PITaskViewController.m
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 11/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import "PITaskViewController.h"

@interface PITaskViewController ()

@end

@implementation PITaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

#pragma mark - ViewController Life Cycle

-(void)viewWillAppear:(BOOL)animated
{
    clockViewIndiaTaskVC.delegate = self;
    clockViewMelbourneTaskVC.delegate = self;
    
    //Working with timeUp
    timeFrame = 90.0;
    timerObj = [NSTimer scheduledTimerWithTimeInterval:timeFrame target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    clockViewIndiaTaskVC.delegate = nil;
    clockViewMelbourneTaskVC.delegate = nil;
    
    [timerObj invalidate];
    
    [popOverController dismissPopoverAnimated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableViewTasks.dataSource = self;
    tableViewTasks.delegate = self;
    
    tableViewUsers.dataSource = self;
    tableViewUsers.delegate = self;
    
    
    tableViewUsersOut.dataSource = self;
    tableViewUsersOut.delegate = self;
    
    
    //Considering a dictionary from server for the tasks
    aryTaskDetailsList = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task Go Get It" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Sam" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task Go Get" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task Go" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Sam" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    dictTaskDetails = [[NSMutableDictionary alloc] init];
    [dictTaskDetails setObject:@"Task" forKey:@"TaskName"];
    [dictTaskDetails setObject:@"Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible Go and get it as soon as possible" forKey:@"TaskDescription"];
    [dictTaskDetails setObject:@"Goutham" forKey:@"TaskPostedBy"];
    [dictTaskDetails setObject:@"Mrudula" forKey:@"TaskAssginedTo"];
    [dictTaskDetails setObject:@"Wed 16 July 12:47:39 pm" forKey:@"TaskPostedTime"];
    [aryTaskDetailsList addObject:dictTaskDetails];
    
    
    
    //User loged in details, making static data
    aryUsersLogedIn = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dictUserDetails = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    [dictUserDetails setObject:@"Goutham Devaraju" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];

    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Mrudula Amirneni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sam Paul Solomon" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sreenath Bagineni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Chris Lim" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Nathan" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Arjun" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Gokul" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    aryLoginHistory = [[NSMutableArray alloc] init];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 10:55AM"];
    [aryLoginHistory addObject:@"Checked in at 9:55AM"];
    [aryLoginHistory addObject:@"Checked out at 11:55AM"];
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Champakamala" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [dictUserDetails setObject:aryLoginHistory forKey:@"History"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    
    //User loged in details, making static data
    aryUsersLogedOut = [[NSMutableArray alloc] init];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sreenath Bagineni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Chris Lim" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Nathan" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    [dictUserDetails setObject:@"Goutham Devaraju" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Mrudula Amirneni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sam Paul Solomon" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedOut addObject:dictUserDetails];
    
    
    
     
    
    
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableView:)];
//    [tableViewTasks addGestureRecognizer:tap];
//    
//    UITapGestureRecognizer *tapOnUsers = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnTableView:)];
//    [tableViewUsers addGestureRecognizer:tapOnUsers];
    
    [self desginTheClockView];
}

-(void)desginTheClockView
{
    
    //clockViewIndia = [[BEMAnalogClockView alloc] init];
    //clockViewIndia.frame = CGRectMake(85, 485, 155, 155);
    clockViewIndiaTaskVC.delegate = self;
    clockViewIndiaTaskVC.currentTime = YES;
    clockViewIndiaTaskVC.faceBackgroundColor = [UIColor whiteColor];
    clockViewIndiaTaskVC.tag = 2;
    clockViewIndiaTaskVC.realTime = YES;

    clockViewIndiaTaskVC.minuteHandLength = clockViewIndiaTaskVC.minuteHandLength-15;
    clockViewIndiaTaskVC.hourHandLength = clockViewIndiaTaskVC.hourHandLength-8;

    clockViewIndiaTaskVC.minuteHandLength = clockViewIndiaTaskVC.minuteHandLength-20;
    clockViewIndiaTaskVC.hourHandLength = clockViewIndiaTaskVC.hourHandLength-5;

    clockViewIndiaTaskVC.secondHandLength = clockViewIndiaTaskVC.secondHandLength-10;
    clockViewIndiaTaskVC.secondHandColor = [UIColor clearColor];//121 236 253
    clockViewIndiaTaskVC.hourHandColor = [UIColor blackColor];
    clockViewIndiaTaskVC.minuteHandColor = [UIColor blackColor];
    clockViewIndiaTaskVC.borderColor = [UIColor blackColor];
    clockViewIndiaTaskVC.minuteHandOffsideLength = 0;
    clockViewIndiaTaskVC.hourHandOffsideLength = 0;
    clockViewIndiaTaskVC.hourHandWidth = 1.0;
    clockViewIndiaTaskVC.minuteHandWidth = 1.0;
    clockViewIndiaTaskVC.secondHandWidth = 1.0;
    clockViewIndiaTaskVC.minuteHandColor = [UIColor blackColor];
    clockViewIndiaTaskVC.borderColor = [UIColor blackColor];
    clockViewIndiaTaskVC.borderWidth = clockViewMelbourneTaskVC.borderWidth/3;
    clockViewIndiaTaskVC.enableShadows = NO;
    [clockViewIndiaTaskVC startRealTime];
    //[self.view addSubview:clockViewIndia];
    
    
    
    
    //clockViewMelbourne.frame = CGRectMake(85, 322, 155, 155);//85 322 155 128
    clockViewMelbourneTaskVC.delegate = self;
    clockViewMelbourneTaskVC.currentTime = NO;
    clockViewMelbourneTaskVC.faceBackgroundColor = [UIColor whiteColor];
    clockViewMelbourneTaskVC.tag = 1;
    clockViewMelbourneTaskVC.realTime = YES;

    clockViewMelbourneTaskVC.minuteHandLength = clockViewMelbourneTaskVC.minuteHandLength-15;
    clockViewMelbourneTaskVC.hourHandLength = clockViewMelbourneTaskVC.hourHandLength-8;

    clockViewMelbourneTaskVC.minuteHandLength = clockViewMelbourneTaskVC.minuteHandLength-20;
    clockViewMelbourneTaskVC.hourHandLength = clockViewMelbourneTaskVC.hourHandLength-5;

    clockViewMelbourneTaskVC.secondHandLength = clockViewMelbourneTaskVC.secondHandLength-10;
    clockViewMelbourneTaskVC.secondHandColor = [UIColor clearColor];//121 236 253
    clockViewMelbourneTaskVC.hourHandColor = [UIColor blackColor];
    clockViewMelbourneTaskVC.hourHandWidth = 1.0;
    clockViewMelbourneTaskVC.minuteHandWidth = 1.0;
    clockViewMelbourneTaskVC.secondHandWidth = 1.0;
    clockViewMelbourneTaskVC.minuteHandColor = [UIColor blackColor];
    clockViewMelbourneTaskVC.borderColor = [UIColor blackColor];
    clockViewMelbourneTaskVC.borderWidth = clockViewMelbourneTaskVC.borderWidth/3;
    clockViewMelbourneTaskVC.minuteHandOffsideLength = 0;
    clockViewMelbourneTaskVC.hourHandOffsideLength = 0;
    clockViewMelbourneTaskVC.enableShadows = NO;
    
    [clockViewMelbourneTaskVC startRealTime];
    //[self.view addSubview:clockViewMelbourne];
    
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
    clockViewMelbourneTaskVC.hours = [strHours intValue];
    clockViewMelbourneTaskVC.minutes = [strMinutes intValue];
    clockViewMelbourneTaskVC.seconds = [strSeconds intValue];
    [clockViewMelbourneTaskVC updateTimeAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [timerObj invalidate];
    timerObj = [NSTimer scheduledTimerWithTimeInterval:timeFrame target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
    
    if(tableView.tag == 1)
    {
        NSDictionary *dictTaskDetails = aryTaskDetailsList[indexPath.row];
        
        CGRect contentRect = CGRectMake(0, 0, 670, 300);
        
        UIViewController *popoverContent = [[UIViewController alloc] init];
        popoverContent.preferredContentSize = contentRect.size;
        
        popOverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
        popOverController.delegate = self;
        
        UIView *popoverContentView = [self popOverDesignWithDictionary:dictTaskDetails WithRect:contentRect];
        [popoverContent.view addSubview:popoverContentView];
        
        UITableViewCell *tblCell = [tableView cellForRowAtIndexPath:indexPath];
        CGRect rectSuper = tblCell.frame;
        [popOverController presentPopoverFromRect:CGRectMake(0, -5, rectSuper.size.width, rectSuper.size.height) inView:tblCell permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else if(tableView.tag == 2)
    {
        NSDictionary *dictLoginDetails = aryUsersLogedIn[indexPath.row];
        
        
        CGRect contentRect = CGRectMake(0, 0, 300, 300);

        UIViewController* popoverContent = [[UIViewController alloc] init];
        popoverContent.preferredContentSize = contentRect.size;
        
        popOverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
        popOverController.delegate = self;
        
        UIView *popoverContentView = [self popOverUsersDetailDesignWithDictionary:dictLoginDetails WithRect:contentRect];
        [popoverContent.view addSubview:popoverContentView];
        
        UITableViewCell *tblCell = [tableView cellForRowAtIndexPath:indexPath];
        CGRect rectSuper = tblCell.frame;
        [popOverController presentPopoverFromRect:CGRectMake(0, 0, rectSuper.size.width, rectSuper.size.height) inView:tblCell permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    }
    else
    {
        NSDictionary *dictLoginDetails = aryUsersLogedIn[indexPath.row];
        
        
        CGRect contentRect = CGRectMake(0, 0, 300, 300);
        
        UIViewController* popoverContent = [[UIViewController alloc] init];
        popoverContent.preferredContentSize = contentRect.size;
        
        popOverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
        popOverController.delegate = self;
        
        UIView *popoverContentView = [self popOverUsersDetailDesignWithDictionary:dictLoginDetails WithRect:contentRect];
        [popoverContent.view addSubview:popoverContentView];
        
        UITableViewCell *tblCell = [tableView cellForRowAtIndexPath:indexPath];
        CGRect rectSuper = tblCell.frame;
        [popOverController presentPopoverFromRect:CGRectMake(0, 0, rectSuper.size.width, rectSuper.size.height) inView:tblCell permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    
    NSLog(@"Timer invalidated");
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == 1)
        return [aryTaskDetailsList count];
    else if(tableView.tag == 2)
        return [aryUsersLogedIn count];
    else
        return [aryUsersLogedOut count];
}

//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 53;
//}

//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//	UIView *view;
//    float width = tableView.frame.size.width;
//    float height = 52;
//    
//    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    
//    return view;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if(tableView.tag == 1)
//        return 50;
//    else
//        return 50;
    
    return 50;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView.tag == 1)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 50)];
        [label setFont:[UIFont fontWithName:@"Futura-Medium" size:22.0]];
        
        NSString *string = @"Task Lists";
        /* Section header is in 0th index... */
        [label setText:string];
        [view addSubview:label];
        [view setBackgroundColor:[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0]]; //your background color...
        
        return view;
    }
    else if(tableView.tag == 2)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 50)];
        [label setFont:[UIFont fontWithName:@"Futura-Medium" size:22.0]];
        NSString *string = @"In Right Now";
        [label setText:string];
        [view addSubview:label];
        [view setBackgroundColor:[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0]];
        
        return view;
    }
    else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 50)];
        [label setFont:[UIFont fontWithName:@"Futura-Medium" size:22.0]];
        NSString *string = @"Out Right Now";
        [label setText:string];
        [view addSubview:label];
        [view setBackgroundColor:[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0]];
        
        return view;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == 1)
    {
        NSString *strCell = [NSString stringWithFormat:@"strCellTaskView"];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        NSDictionary *dictTaskDesc = aryTaskDetailsList[indexPath.row];
        
        cell.textLabel.text = [dictTaskDesc valueForKey:@"TaskName"];
        return cell;
    }
    else if(tableView.tag == 2)
    {
        NSString *strCell = [NSString stringWithFormat:@"strCellUsers"];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
             [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSDictionary *dictUserDetails = aryUsersLogedIn[indexPath.row];
        
        NSString *strName = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"Name"]];
        NSString *strCheckInTime = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"CheckInTime"]];
        
        cell.textLabel.text = strName;
        cell.detailTextLabel.text = strCheckInTime;
        
        return cell;
    }
    else
    {
        NSString *strCell = [NSString stringWithFormat:@"strCellUser"];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSDictionary *dictUserDetails = aryUsersLogedOut[indexPath.row];
        
        NSString *strName = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"Name"]];
        NSString *strCheckInTime = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"CheckInTime"]];
        
        cell.textLabel.text = strName;
        cell.detailTextLabel.text = strCheckInTime;
        
        return cell;
    }
    
//    UIView *viewCell = [cell contentView];
//    [[viewCell subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    viewCell.backgroundColor = [UIColor redColor];//246
//    
//    UIImage *img = [UIImage imageNamed:@"Line_CellSeperator"];
//    
//    UIImageView *imgViewCellSeperator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
//    imgViewCellSeperator.image = img;
//    [viewCell addSubview:imgViewCellSeperator];
//    
//    UILabel *lblCellText = [[UILabel alloc] initWithFrame:CGRectMake(25, -1, 600, viewCell.frame.size.height)];
//    lblCellText.text = arrayItem[indexPath.row];
//    lblCellText.backgroundColor = [UIColor greenColor];
//    [viewCell addSubview:lblCellText];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Touches Method
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [timerObj invalidate];
    timerObj = [NSTimer scheduledTimerWithTimeInterval:timeFrame target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
    NSLog(@"Timer invalidated");
}

-(void)didTapOnTableView:(id)sender
{
    [timerObj invalidate];
    timerObj = [NSTimer scheduledTimerWithTimeInterval:timeFrame target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
    NSLog(@"Timer invalidated");
}

#pragma mark - Time Up Method

-(void)timeUp:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

#pragma mark - Check In Out Event
-(IBAction)checkInOutEvent:(id)sender
{
    
}

#pragma mark - Flip Code
- (IBAction)flip:(id)sender
{
//    if (didFlip == NO)
//    {
//        [UIView transitionFromView:viewFlipForTable toView:viewAfterFlip
//                          duration:0.5
//                           options:UIViewAnimationOptionTransitionFlipFromLeft
//                        completion:NULL];
//        
//        didFlip = YES; // a = !a;
//    }
//    else
//    {
//        [UIView transitionFromView:viewAfterFlip toView:viewFlipForTable
//                          duration:0.5
//                           options:UIViewAnimationOptionTransitionFlipFromRight
//                        completion:NULL];
//        
//        viewFlipForTable.frame = CGRectMake(0, 0, viewFlipForTable.frame.size.width, viewFlipForTable.frame.size.width);
//        
//        didFlip = NO; // a = !a;
//    }
    
    
    
    [UIView transitionWithView:viewForFlip
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        if (!didFlip)
                        {
                            [viewFlipForTable setHidden:YES];
                            [viewAfterFlip setHidden:NO];
                            didFlip = YES;
                        }
                        else
                        {
                            [viewFlipForTable setHidden:NO];
                            [viewAfterFlip setHidden:YES]; //or hide it.
                            didFlip = NO;
                        }
                    }completion:nil];
}

#pragma mark - PopOver Design

-(UIView*)popOverDesignWithDictionary:(NSDictionary*)dictPopOverItems WithRect:(CGRect)rectPopOver
{
    UIView *viewPop = [[UIView alloc] initWithFrame:rectPopOver];
    viewPop.backgroundColor = [UIColor whiteColor];
    
    UILabel *lblTaskName = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 500, 50)];
    lblTaskName.text = [dictPopOverItems valueForKey:@"TaskName"];
    lblTaskName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    [viewPop addSubview:lblTaskName];
    
    UITextView *textViewDescription = [[UITextView alloc] initWithFrame:CGRectMake(20, lblTaskName.frame.size.height+lblTaskName.frame.origin.y+10, rectPopOver.size.width-40, 100)];
    textViewDescription.backgroundColor = [UIColor whiteColor];
    textViewDescription.text = [dictPopOverItems valueForKey:@"TaskDescription"];
    textViewDescription.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    [viewPop addSubview:textViewDescription];
    
    UILabel *lblAssignedTo = [[UILabel alloc] initWithFrame:CGRectMake(20, textViewDescription.frame.size.height+textViewDescription.frame.origin.y+30, 250, 50)];
    lblAssignedTo.text = [NSString stringWithFormat:@"Assigned To: %@",[dictPopOverItems valueForKey:@"TaskAssginedTo"]];
    lblAssignedTo.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    [viewPop addSubview:lblAssignedTo];
    
    UILabel *lblPostedBy = [[UILabel alloc] initWithFrame:CGRectMake(350, textViewDescription.frame.size.height+textViewDescription.frame.origin.y+30, 250, 50)];
    lblPostedBy.text = [NSString stringWithFormat:@"Posted By: %@",[dictPopOverItems valueForKey:@"TaskPostedBy"]];
    lblPostedBy.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    [viewPop addSubview:lblPostedBy];
    
    UILabel *lblPostedTime = [[UILabel alloc] initWithFrame:CGRectMake(20, lblPostedBy.frame.size.height+lblPostedBy.frame.origin.y, 500, 50)];
    lblPostedTime.text = [dictPopOverItems valueForKey:@"TaskPostedTime"];
    lblPostedTime.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f];
    [viewPop addSubview:lblPostedTime];
    
    return viewPop;
}

-(UIView*)popOverUsersDetailDesignWithDictionary:(NSDictionary*)dictPopOverItems WithRect:(CGRect)rectPopOver
{
    NSArray *arrayCheckInValues = [dictPopOverItems valueForKey:@"History"];
    
    PopUPView *popoverContentView = [[PopUPView alloc] initWithFrame:rectPopOver andarry:arrayCheckInValues];
    [popoverContentView setDelegate:self];
    popoverContentView.backgroundColor = [UIColor clearColor];
    
    return popoverContentView;
}

#pragma mark - PopUp Delegate User History

-(void)selectedValue:(NSNumber *)index
{
    
}


@end
