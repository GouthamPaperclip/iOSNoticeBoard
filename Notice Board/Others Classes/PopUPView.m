//
//  PopUPView.m
//  Replenish
//
//  Created by SNT on 29/11/13.
//  Copyright (c) 2013 SNT. All rights reserved.
//

#import "PopUPView.h"

@implementation PopUPView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
            andarry:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        arrayValues = [NSArray arrayWithArray:array];
        [self setBackgroundColor:[UIColor whiteColor]];
        tblView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        [tblView setDataSource:self];
        [tblView setDelegate:self];
        [tblView setBackgroundColor:[UIColor clearColor]];
        [tblView setBackgroundView:nil];
        [self addSubview:tblView];
        
        oldIndex = -1;
    }
    return self;
}

- (void) attachTableView{
}

- (void) setSelectedIndexPath:(NSString *)string{
    int index = [arrayValues indexOfObject:string];
    
    [self tableView:tblView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayValues count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *strCell = [NSString stringWithFormat:@"%i%i", indexPath.row, indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.textLabel setText:[arrayValues objectAtIndex:indexPath.row]];
        [cell.textLabel setTextColor:[UIColor colorWithRed:17/255.0 green:67/255.0 blue:89/255.0 alpha:1.0]];
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0]];
    }
    if(indexPath.row != oldIndex)
        [cell setBackgroundColor:[UIColor clearColor]];
    else
        [cell setBackgroundColor:[UIColor colorWithRed:199/255.0 green:213/255.0 blue:218/255.0 alpha:1.0]];
    return cell;
}

/*- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
 UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 [cell setAccessoryType:UITableViewCellAccessoryNone];
 }*/

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row != oldIndex){
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setBackgroundColor:[UIColor colorWithRed:199/255.0 green:213/255.0 blue:218/255.0 alpha:1.0]];
        //[self.delegate performSelector:@selector(selectedValue:) withObject:[NSNumber numberWithInt:indexPath.row]];
        [self.delegate selectedValue:[NSNumber numberWithInt:indexPath.row]];
        
        if(oldIndex != -1){
            cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:oldIndex inSection:0]];
            //[cell setAccessoryType:UITableViewCellAccessoryNone];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        oldIndex = indexPath.row;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
