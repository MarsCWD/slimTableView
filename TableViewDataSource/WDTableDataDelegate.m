//
//  UITableViewDataSource.m
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/2/22.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "WDTableDataDelegate.h"

@interface WDTableDataDelegate ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) NSString *cellIdentifier;

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) DidSelectCellBlock didSelectCellBlock;
@property (nonatomic, copy) CellHeightBlock cellHeightBlock;
//@property (nonatomic, copy) TableHeaderHeightBlock tableHeaderHeightBlock;
//@property (nonatomic, copy) TableFooterHeightBlock tableFooterHeightBlock;
@end

@implementation WDTableDataDelegate

#pragma mark - init Method
- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock {
    return [self initWithTableView:tableView
                         cellClass:cellClass
                configureCellBlock:configureCellBlock
                   cellHeightBlock:nil];
}

- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeightBlock:(CellHeightBlock)cellHeightBlock {
    return [self initWithTableView:tableView
                         cellClass:cellClass
                configureCellBlock:configureCellBlock
                   cellHeightBlock:cellHeightBlock
                didSelectCellBlock:nil];
}

- (instancetype)initWithTableView:(UITableView *)tableView
                        cellClass:(Class)cellClass
               configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeightBlock:(CellHeightBlock)cellHeightBlock
               didSelectCellBlock:(DidSelectCellBlock)didSelectCellBlock {
    self = [super init];
    if (!self) {
        return nil;
    }
    NSAssert(tableView, @"tableView can not be nil");
    NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]], @"class is not an UItableViewCell subClass");
    
    _tableView = tableView;
    _cellIdentifier = NSStringFromClass(cellClass);
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:cellClass forCellReuseIdentifier:_cellIdentifier];
    
    _configureCellBlock = configureCellBlock;
    _cellHeightBlock = cellHeightBlock;
    _didSelectCellBlock = didSelectCellBlock;
    
    return self;
}

- (id)itemWithIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    if (tableView.style == UITableViewStylePlain) {
        return self.items[indexPath.row];
    } else {
        return ((NSArray *)self.items[indexPath.section])[indexPath.row];
    }
}

#pragma mark -
#pragma mark tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        return self.items.count;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.style == UITableViewStylePlain) {
        return self.items.count;
    } else {
        return ((NSArray *)self.items[section]).count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    
    if (self.configureCellBlock) {
        id item = [self itemWithIndexPath:indexPath tableView:tableView];
        self.configureCellBlock(item, indexPath, cell);
    }
    
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectCellBlock) {
        id item = [self itemWithIndexPath:indexPath tableView:tableView];
        self.didSelectCellBlock(item, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellHeightBlock) {
        id item = [self itemWithIndexPath:indexPath tableView:tableView];
        return self.cellHeightBlock(item, indexPath);
    } else {
        return 44.0;
    }
}

#pragma mark - setter
- (void)setItems:(NSArray *)items {
    _items = items;
    
    [self.tableView reloadData];
}

@end
