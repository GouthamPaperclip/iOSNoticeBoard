//
//  PIQRCodeReaderViewController.m
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 10/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import "PIQRCodeReaderViewController.h"

@interface PIQRCodeReaderViewController ()

@end

@implementation PIQRCodeReaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)predentAction:(id)sender
{
    NSLog(@"Predent action");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
