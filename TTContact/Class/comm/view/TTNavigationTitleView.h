//
//  TTNavigationTitleView.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NavigationTitleViewHeight NAVIGATIONBAR_HEIGHT
#define NavigationTitleViewLoadingSize 16
#define NavigationTitleViewArrowMarginLeft 5

typedef NS_ENUM(NSInteger, TTNavigationTitleViewType) {
    TTNavigationTitleViewTypeNormal,    // 普通的文本类型
    TTNavigationTitleViewTypeButton,    // 可操作类型
};

// titleView的状态，只对TTNavigationTitleViewTypeButton类型的有效
typedef NS_ENUM(NSInteger, TTNavigationTitleViewStatus) {
    TTNavigationTitleViewStatusNormal,  // 默认状态，箭头向下
    TTNavigationTitleViewStatusActived, // 活动状态，箭头向上
};

@class TTNavigationTitleView;

@protocol TTNavigationTitleViewDelegate <NSObject>

@optional
// status发生变化前的回调，可在这里配合TTNavigationBarDropdown使用
- (void)titleView:(TTNavigationTitleView *)titleView willStatusChanged:(TTNavigationTitleViewStatus)status;
// status变化后的回调
- (void)titleView:(TTNavigationTitleView *)titleView didStatusChanged:(TTNavigationTitleViewStatus)status;
// 点击后titleView的回调
- (void)titleView:(TTNavigationTitleView *)titleView handleTouchEventWithStatus:(TTNavigationTitleViewStatus)status;

@end

@interface TTNavigationTitleView : UIButton {
    TTNavigationTitleViewType       _type;
    TTNavigationTitleViewStatus     _status;                // 只对TTNavigationTitleViewTypeButton有效，标志当前是否处于活动状态
    BOOL                            _isLoadingViewNeeded;   // 是否需要loading，若需要则布局时会预留loadingView的占位，默认为NO
    BOOL                            _isLoadingViewShow;     // 当前loadingView是否显示中
    UIImage                         *_arrowImageDown;
    CGSize                          _arrowViewSize;         // 缓存箭头的大小，避免布局时重新计算，在非TTNavigationTitleViewTypeButton类型时为CGSizeZero
    UIImageView                     *_arrowView;            // 箭头，只在TTNavigationTitleViewTypeButton类型下初始化，其他类型为nil
    UIActivityIndicatorView         *_loadingView;          // 主标题左边的loading
}

@property(nonatomic,weak) id<TTNavigationTitleViewDelegate> delegate;
@property(nonatomic,strong,readonly) UILabel *textLabel; // 主标题
@property(nonatomic,strong,readonly) UILabel *subLabel; // 副标题
@property(nonatomic,assign) BOOL shouldLayoutSubviews;

- (id)initWithType:(TTNavigationTitleViewType)type;
- (id)initWithType:(TTNavigationTitleViewType)type title:(NSString *)title;
- (id)initWithType:(TTNavigationTitleViewType)type title:(NSString *)title subTitle:(NSString *)subTitle;

- (void)setNeedsLoadingView:(BOOL) needed;
- (void)setTitleViewType:(TTNavigationTitleViewType) type; // 需要切换类型时调用

- (void)setTitle:(NSString *) title;
- (void)setTitleTouchableForDebug;
- (void)setSubTitle:(NSString *) subTitle;
- (void)showLoadingView:(BOOL) isShow;

- (void)setStatusToNormal;
- (void)setStatusToActived;

- (void)setEnabled:(BOOL)enabled; // enabled = NO时，箭头就会变灰了

@end
