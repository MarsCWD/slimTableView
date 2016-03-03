//
//  UITableViewDataSource.h
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/2/22.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void    (^TableViewCellConfigureBlock)(id item, NSIndexPath *indexPath, UITableViewCell *cell);
typedef void    (^DidSelectCellBlock)(id item, NSIndexPath *indexPath);

typedef CGFloat (^CellHeightBlock)(id item, NSIndexPath *indexPath);
//typedef CGFloat (^TableHeaderHeightBlock)(id item, NSIndexPath *indexPath);
//typedef CGFloat (^TableFooterHeightBlock)(id item, NSIndexPath *indexPath);
//
//typedef UIView *(^TableViewHeaderConfigureBlick)(id item, NSInteger section);

/**
 *  该类目前只适用于tableView列表中使用同一种cell样式的情况，暂不支持多种样式的排布
 */
@interface WDTableDataDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

//列表数据
@property (nonatomic, copy) NSArray *items;

//initialize

/**
 *  初始化方法
 *
 *  @param tableView          所使用的tableView
 *  @param cellClass          cell类
 *  @param configureCellBlock 配置cell的回调
 */
- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeightBlock:(CellHeightBlock)cellHeightBlock;

- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeightBlock:(CellHeightBlock)cellHeightBlock
               didSelectCellBlock:(DidSelectCellBlock)didSelectCellBlock;


@end
