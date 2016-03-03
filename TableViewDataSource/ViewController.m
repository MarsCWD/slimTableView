//
//  ViewController.m
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/2/22.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "ViewController.h"
#import "WDTableDataDelegate.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WDTableDataDelegate *dataDelegate;
@property (nonatomic, strong) NSArray *items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self configuteTable];
}

- (void)configuteTable {
    TableViewCellConfigureBlock cellConfigureBlock = ^(id item, NSIndexPath *indexPath, UITableViewCell *cell) {
        CustomTableViewCell *baseCell = (CustomTableViewCell *)cell;
        baseCell.titleStr = item;
    };
    
    DidSelectCellBlock selectCellBlock = ^(id item, NSIndexPath *indexPath) {
        NSLog(@"%@",item);
    };
    
    CellHeightBlock cellHeightBlock = ^CGFloat(id item, NSIndexPath *indexPath){
        return 20;
    };
    
    self.dataDelegate = [[WDTableDataDelegate alloc] initWithTableView:self.tableView
                                                             cellClass:[CustomTableViewCell class]
                                                    configureCellBlock:cellConfigureBlock
                                                       cellHeightBlock:cellHeightBlock
                                                    didSelectCellBlock:selectCellBlock];
    self.dataDelegate.items = self.items;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (NSArray *)items {
    if (!_items) {
        _items = @[ @"1", @"2", @"3" ];
    }
    return _items;
}

@end
