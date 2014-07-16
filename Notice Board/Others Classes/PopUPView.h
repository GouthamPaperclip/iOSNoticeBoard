//
//  PopUPView.h
//  Replenish
//
//  Created by SNT on 29/11/13.
//  Copyright (c) 2013 SNT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopUPViewDelegate <NSObject>

-(void)selectedValue:(NSNumber *)index;

@end

@interface PopUPView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tblView;
    NSInteger oldIndex;
    NSArray *arrayValues;
    id<PopUPViewDelegate> delegate;
}
@property (nonatomic, retain) id<PopUPViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame
            andarry:(NSArray *)array;
@end
