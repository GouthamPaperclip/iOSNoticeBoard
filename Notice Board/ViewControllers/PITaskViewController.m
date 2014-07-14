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
        arrayItem = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tableViewTasks.dataSource = self;
    tableViewTasks.delegate = self;
    
    tableViewUsers.dataSource = self;
    tableViewUsers.delegate = self;
    
    arrayItem = [NSMutableArray arrayWithObjects:@"Task 1",@"Task 2", nil];
    
    //User loged in details, making static data
    
    aryUsersLogedIn = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dictUserDetails = [[NSMutableDictionary alloc] init];
    
    [dictUserDetails setObject:@"Goutham Devaraju" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Mrudula Amirneni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sam Paul Solomon" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Sreenath Bagineni" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Chris Lim" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Nathan" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Arjun" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Gokul" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
    
    dictUserDetails = [[NSMutableDictionary alloc] init];
    [dictUserDetails setObject:@"Champakamala" forKey:@"Name"];
    [dictUserDetails setObject:@"Checked in at 9:55AM" forKey:@"CheckInTime"];
    [aryUsersLogedIn addObject:dictUserDetails];
 
    
    timerObj = [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(timeUp:) userInfo:nil repeats:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == 1)
        return [arrayItem count];
    else
        return [aryUsersLogedIn count];
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

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == 1)
    {
        NSString *strCell = [NSString stringWithFormat:@"strCellTaskView"];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            cell.textLabel.text = arrayItem[indexPath.row];
        }
        return cell;
    }
    else
    {
        //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        NSString *strCell = [NSString stringWithFormat:@"strCell"];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
//            cell.textLabel.text = arrayItem[indexPath.row];
//            cell.detailTextLabel.text = arrayItem[indexPath.row];
            
            NSDictionary *dictUserDetails = aryUsersLogedIn[indexPath.row];
            
            NSString *strName = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"Name"]];
            NSString *strCheckInTime = [NSString stringWithFormat:@"%@",[dictUserDetails valueForKey:@"CheckInTime"]];
            
            cell.textLabel.text = strName;
            cell.detailTextLabel.text = strCheckInTime;
        }
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

#pragma mark - Time Up Method

-(void)timeUp:(id)sender
{
    ViewController *viewControllerObj = [[ViewController alloc] initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
    
    [self.navigationController presentViewController:viewControllerObj animated:YES completion:nil];
}

@end
