//
//  TTCommTableViewCell.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCommTableView.h"

@interface TTCommTableViewCell : UITableViewCell

@property(nonatomic,assign,getter = isEnabled) BOOL enabled;

@property(nonatomic, weak, readonly) UITableView *parentTableView;
@property(nonatomic, assign) CommonTableViewCellPosition position;
@property(nonatomic,assign) UIEdgeInsets borderEdgeInsets;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

- (id)initForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (id)initForTableView:(UITableView *)tableView withReuseIdentifier:(NSString *)reuseIdentifier;// 首选初始化方法

- (void)setCellUIByPosition:(CommonTableViewCellPosition)position;

@end
