//
//  WDBaseTableViewCell.h
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/3/3.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDBaseTableViewCell : UITableViewCell

/**
 *  子类重写该方法，用于UI布局
 */
- (void)setupUI;

/**
 *  子类重写该方法用于更新cell内部数据
 */
- (void)configure:(UITableViewCell *)cell
             item:(id)item
        indexPath:(NSIndexPath *)indexPath;

/**
 *  子类需重写该方法，默认是44
 */
+ (CGFloat)calculateCellHeightWithItem:(id)item;

@end
