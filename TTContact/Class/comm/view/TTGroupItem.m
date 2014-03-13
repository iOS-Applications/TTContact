//
//  TTGroupItem.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-27.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTGroupItem.h"

@implementation TTGroupItem

+ (UITextField *)textFieldWithPosition:(GroupItemPosition)position itemType:(TextFieldType)type itemTitle:(NSString *)title isTextAlignmentRight:(BOOL)textAlignment
{
    //    init item
    UITextField *textFieldItem = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 2 * GROUP_ITEM_MARGINHOR, GROUP_ITEM_HEIGHT)];
	textFieldItem.borderStyle = UITextBorderStyleNone;
    textFieldItem.backgroundColor = UIColorClear;
	textFieldItem.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	textFieldItem.font = UIFontMake(18);
    //    textFieldItem.textColor = UIColorMake(47, 50, 64);
    textFieldItem.textColor = UIColorBlack;
    textFieldItem.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //    field type
    if (type == TextFieldTypeText) {
    	textFieldItem.secureTextEntry = NO;
        textFieldItem.adjustsFontSizeToFitWidth = YES;
        textFieldItem.keyboardType = UIKeyboardTypeASCIICapable;
        textFieldItem.returnKeyType = UIReturnKeyNext;
        textFieldItem.autocorrectionType = UITextAutocorrectionTypeNo;
    } else if (type == TextFieldTypePassword) {
        textFieldItem.secureTextEntry = YES;
        textFieldItem.returnKeyType = UIReturnKeyGo;
    }
    //    item position
    switch (position) {
        case GroupItemPositionTop: {
            textFieldItem.background = [[UIImage imageNamed:@"group_input_top"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        case GroupItemPositionInner: {
            textFieldItem.background = [[UIImage imageNamed:@"group_input_middle"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        case GroupItemPositionBottom: {
            textFieldItem.background = [[UIImage imageNamed:@"group_input_bottom"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        default:
            break;
    }
    //    leftview label
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(GROUP_ITEM_PADDING_LEFT, 0, GROUP_ITEM_TITLE_WIDTH, CGRectGetHeight(textFieldItem.frame))];
    titleText.text = title;
    titleText.textAlignment = NSTextAlignmentLeft;
    titleText.textColor = UIColorBlack;
    titleText.backgroundColor = UIColorClear;
    //    leftview
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GROUP_ITEM_TITLE_WIDTH, CGRectGetHeight(textFieldItem.frame))];
    [leftView addSubview:titleText];
    textFieldItem.leftView = leftView;
    textFieldItem.leftViewMode = UITextFieldViewModeAlways;
    //    rightview
    if (textAlignment) {
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetWidth(leftView.frame) + CGRectGetWidth(textFieldItem.frame), GROUP_ITEM_PADDING_RIGHT, CGRectGetHeight(textFieldItem.frame))];
        textFieldItem.rightView = rightView;
        textFieldItem.rightViewMode = UITextFieldViewModeAlways;
        textFieldItem.textAlignment = NSTextAlignmentRight;
    } else {
        textFieldItem.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return textFieldItem;
}

+ (UIView *)viewWithHeight:(int)height itemPosition:(GroupItemPosition)position contentView:(UIView *)view itemTitle:(NSString *)title {
    UIView *viewItem = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 2 * GROUP_ITEM_MARGINHOR, height)];
    //    item position
    UIImageView *viewItemBg = [[UIImageView alloc] initWithFrame:viewItem.frame];
    switch (position) {
        case GroupItemPositionTop: {
            viewItemBg.image = [[UIImage imageNamed:@"group_input_top"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        case GroupItemPositionInner: {
            viewItemBg.image = [[UIImage imageNamed:@"group_input_middle"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        case GroupItemPositionBottom: {
            viewItemBg.image = [[UIImage imageNamed:@"group_input_bottom"] stretchableImageWithLeftCapWidth:9 topCapHeight:5];
        }
            break;
        default:
            break;
    }
    [viewItem addSubview:viewItemBg];
    //    leftview label
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(GROUP_ITEM_PADDING_LEFT, 0, GROUP_ITEM_TITLE_WIDTH, CGRectGetHeight(viewItem.frame))];
    titleText.text = title;
    titleText.textAlignment = NSTextAlignmentLeft;
    titleText.textColor = UIColorBlack;
    titleText.backgroundColor = UIColorClear;
    titleText.backgroundColor = UIColorClear;
    //    leftview
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GROUP_ITEM_TITLE_WIDTH, CGRectGetHeight(viewItem.frame))];
    [titleView addSubview:titleText];
    [viewItem addSubview:titleView];
    //    add view
    [viewItem addSubview:view];
    return viewItem;
}

+ (UIView *)viewWithPosition:(GroupItemPosition)position contentView:(UIView *)view itemTitle:(NSString *)title {
    return [TTGroupItem viewWithHeight:GROUP_ITEM_HEIGHT itemPosition:position contentView:view itemTitle:title];
}

@end
