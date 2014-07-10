//
//  LoginViewController.h
//  Notice Board
//
//  Created by Paperclip Innovations 2 on 10/07/14.
//  Copyright (c) 2014 Paperclip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    
}

@property(nonatomic, strong) IBOutlet UITextField *textFieldUserName;
@property(nonatomic, strong) IBOutlet UITextField *textFieldPassword;

-(IBAction)loginClicked:(id)sender;

@end
