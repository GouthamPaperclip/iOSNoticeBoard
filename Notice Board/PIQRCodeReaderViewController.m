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

-(void)viewWillAppear:(BOOL)animated
{
    //Working with timeUp
    timeFrame = 5.0;
    timerObj = [NSTimer scheduledTimerWithTimeInterval:timeFrame target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
}

-(IBAction)predentAction:(id)sender
{
    NSLog(@"Pretend action");
    
    [timerObj invalidate];
    
//    ZBarReaderViewController *codeReader = [ZBarReaderViewController new];
//    codeReader.readerDelegate=self;
//    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
//    
//    if([ZBarReaderController isSourceTypeAvailable:
//        UIImagePickerControllerSourceTypeCamera])
//        codeReader.sourceType = UIImagePickerControllerSourceTypeCamera;
//    [codeReader.scanner setSymbology: ZBAR_I25
//                          config: ZBAR_CFG_ENABLE
//                              to: 0];
//    
//    ZBarImageScanner *scanner = codeReader.scanner;
//    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
//    
//    [self presentViewController:codeReader animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZBar's Delegate method

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    //  get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // just grab the first barcode
        break;
    
    // showing the result on textview
    //resultTextView.text = symbol.data;
    NSLog(@"string scanned : %@",symbol.data);
    
    UIImage *image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    //resultImageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // dismiss the controller
    [reader dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Touches Method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
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
