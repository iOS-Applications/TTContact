//
//  TTCommUI.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <Foundation/Foundation.h>

// === iOS版本 ===

#ifndef IOS_VERSION
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#endif

// === 变量-布局相关 ===

#define IS_LANDSCAPE UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
#define STATUSBAR_HEIGHT (IS_LANDSCAPE ? ([[UIApplication sharedApplication] statusBarFrame].size.width) : ([[UIApplication sharedApplication] statusBarFrame].size.height))
#define NAVIGATIONBAR_HEIGHT (IS_LANDSCAPE ? 32 : 44)
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define VIEW_HEIGHT (SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVIGATIONBAR_HEIGHT)

// === 颜色 ===

#define UIColorClear [UIColor clearColor]
#define UIColorBlack [UIColor blackColor]
#define UIColorWhite [UIColor whiteColor]
#define UIColorGray  [UIColor grayColor]
#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorMakeRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#define UIColorMakeByString(hex) [UIColor colorWithHexString:hex]
// 设置用于顶部导航栏的文字样式
#define NavigationTitleLabelSet(label) [label setBackgroundColor:[UIColor clearColor]];[label setFont:[UIFont boldSystemFontOfSize:18]];[label setTextColor:UIColorWhite];
// app主色调
#define TintColorNormal UIColorMake(0, 112, 205)
#define TintColorHighlighted UIColorMake(204, 221, 235)
#define TintColorDisabled UIColorMake(167, 167, 167)

#define BackgroudColor UIColorMake(240, 240, 240)

// === size ===

#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]
#define LoadingViewSystemSize 20    // loadingView本身默认大小，只能用缩放来调整大小
#define SECTIONHEADER_HEIGHT 20     // grouped类型的表格，headerInSection的值
#define SECTIONHEADER_WITHTITLE_HEIGHT 30   // 带文字的sectionheader高度
#define LOGIN_BUTTON_HEIGHT 38
#define LOGIN_BUTTON_MARGIN_HORIZONTAL 15

// === style ===

#define CELL_TEXTLABEL_FORMAT(label) [label setFont:UIFontMake(17)];[label setTextColor:[UIColor blackColor]];
// UIBarButtonItem在iOS7以下版本的样式
// normal
#define UIBarButtonItemNormal [NSDictionary dictionaryWithObjectsAndKeys:TintColorNormal,UITextAttributeTextColor,TTButtonFont,UITextAttributeFont,TintColorNormal,UITextAttributeTextShadowColor,[NSValue valueWithCGSize:CGSizeMake(0, 0)],UITextAttributeTextShadowOffset,nil]
// lighlighted
#define UIBarButtonItemHighlighted [NSDictionary dictionaryWithObjectsAndKeys:TintColorHighlighted,UITextAttributeTextColor,TTButtonFont,UITextAttributeFont,TintColorNormal,UITextAttributeTextShadowColor,[NSValue valueWithCGSize:CGSizeMake(0, 0)],UITextAttributeTextShadowOffset,nil]
// disabled
#define UIBarButtonItemDisabled [NSDictionary dictionaryWithObjectsAndKeys:TintColorDisabled,UITextAttributeTextColor,TTButtonFont,UITextAttributeFont,TintColorNormal,UITextAttributeTextShadowColor,[NSValue valueWithCGSize:CGSizeMake(0, 0)],UITextAttributeTextShadowOffset,nil]
// blod normal
#define UIBarButtonItemBlodNormal [NSDictionary dictionaryWithObjectsAndKeys:TintColorNormal,UITextAttributeTextColor,TTButtonFontBold,UITextAttributeFont,TintColorNormal,UITextAttributeTextShadowColor,[NSValue valueWithCGSize:CGSizeMake(0, 0)],UITextAttributeTextShadowOffset,nil]

// === 其他 ===

// iOS7下使用与键盘一致的动画，iOS7之前的使用默认的动画函数
#define TTAnimationCurveOut (IOS_VERSION >= 7 ? (7<<16) : UIViewAnimationOptionCurveEaseInOut) // 用于view出现
#define TTAnimationCurveIn (IOS_VERSION >= 7 ? (8<<16) : UIViewAnimationOptionCurveEaseInOut) // 用于view隐藏

// === CGRect扩张 ===
CG_INLINE CGRect
CGRectSetX(CGRect rect, CGFloat x)
{
    rect.origin.x = x;
    return rect;
}
CG_INLINE CGRect
CGRectSetY(CGRect rect, CGFloat y)
{
    rect.origin.y = y;
    return rect;
}
CG_INLINE CGRect
CGRectSetXY(CGRect rect, CGFloat x, CGFloat y)
{
    rect.origin.x = x;
    rect.origin.y = y;
    return rect;
}
CG_INLINE CGRect
CGRectMakeWithSize(CGSize size)
{
    return CGRectMake(0, 0, size.width, size.height);
}

@interface TTCommUI : NSObject

// UIActivityIndicatorView只能通过缩放来控制大小，获取UIActivityIndicatorView默认大小使用宏LoadingViewSystemSize
+ (UIActivityIndicatorView *)loadingViewWithFrame:(CGRect)frame;
+ (UIActivityIndicatorView *)loadingViewWithCenter:(CGPoint)center;
+ (UIActivityIndicatorView *)loadingViewWithCenter:(CGPoint)center size:(CGSize)size;

@end
