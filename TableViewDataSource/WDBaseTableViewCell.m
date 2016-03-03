//
//  WDBaseTableViewCell.m
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/3/3.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "WDBaseTableViewCell.h"

@implementation WDBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    [self setupUI];
    return self;
}

- (void)setupUI {}

- (void)configure:(UITableViewCell *)cell
             item:(id)item
        indexPath:(NSIndexPath *)indexPath {
    //rewrite this func in subclass
}

+ (CGFloat)calculateCellHeightWithItem:(id)item {
    return 44;
}

@end
