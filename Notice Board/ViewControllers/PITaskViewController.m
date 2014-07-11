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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    NSString *strCell = [NSString stringWithFormat:@"strCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    
    if(tableView.tag == 1)
    {
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            cell.textLabel.text = arrayItem[indexPath.row];
        }
    }
    else
    {
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            cell.textLabel.text = arrayItem[indexPath.row];
            
            cell.detailTextLabel.text = arrayItem[indexPath.row];
        }
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
    
    return cell;
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
