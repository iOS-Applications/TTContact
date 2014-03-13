//
//  TTGroupItem.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-27.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

// 用于登录和注册那样格式的类tableview的东东
// 封装这个东东是为了方便，而不用写tableview那一堆的delegate

#import <Foundation/Foundation.h>
#import "TTCommUI.h"

#define GROUP_ITEM_HEIGHT 44            // 每个输入框达到高
#define GROUP_ITEM_MARGINHOR 0         // 距离左右两边的距离
#define GROUP_ITEM_TITLE_WIDTH 93       // title区域的宽度
#define GROUP_ITEM_PADDING_LEFT 12      // title左边padding的宽度
#define GROUP_ITEM_PADDING_RIGHT 14     // title右边padding的宽度
#define GROUP_ITEM_ORIGINY SECTIONHEADER_WITHTITLE_HEIGHT  // 距离顶部的距离

typedef NS_ENUM(NSInteger, GroupItemPosition) {
    GroupItemPositionTop,       // 顶部
    GroupItemPositionInner,     // 中间
    GroupItemPositionBottom,    // 底部
    GroupItemPositionSingle     // 单个
};
typedef NS_ENUM(NSInteger, TextFieldType) {
    TextFieldTypePassword,
    TextFieldTypeText
};

@interface TTGroupItem : NSObject

//默认的高度是44，使用前两个函数即可。如果有特殊的高度（非44，如添加账号中的选择头像），则使用第三个函数
+ (UITextField *)textFieldWithPosition:(GroupItemPosition)position itemType:(TextFieldType)type itemTitle:(NSString *)title isTextAlignmentRight:(BOOL) textAlignment;
+ (UIView *)viewWithPosition:(GroupItemPosition)position contentView:(UIView *)view itemTitle:(NSString *)title;
+ (UIView *)viewWithHeight:(int)height itemPosition:(GroupItemPosition)position contentView:(UIView *)view itemTitle:(NSString *)title;

@end
