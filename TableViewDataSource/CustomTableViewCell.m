//
//  BaseTableViewCell.m
//  TableViewDataSource
//
//  Created by ChenWeidong on 16/2/22.
//  Copyright © 2016年 陈卫东. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell ()
@property (nonatomic, strong) UILabel *title;
@end

@implementation CustomTableViewCell

- (void)setupUI {
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor = [UIColor cyanColor];
    [self.contentView addSubview:_title];
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    
    _title.text = _titleStr;
}

@end
