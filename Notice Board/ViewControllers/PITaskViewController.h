//
//  PITaskViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 11/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"

@interface PITaskViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UIView *viewUsers;
    IBOutlet UIView *viewMenuBar;
    
    IBOutlet UITableView *tableViewTasks;
    IBOutlet UITableView *tableViewUsers;
    
    //Array that contains
    NSMutableArray *arrayItem;
    
    NSMutableArray *aryUsersLogedIn;
    
    NSTimer *timerObj;
}
@end
