//
//  TTButton.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-27.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTButton.h"

@implementation TTButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    float alpha = highlighted ? .3 : 1;
    self.alpha = alpha;
//    self.imageView.alpha = alpha;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    float alpha = enabled ? 1 : .3;
    self.alpha = alpha;
//    self.imageView.alpha = alpha;
}

+ (void)renderButtonAppearanceStyle {
    if (IOS_VERSION < 7) {
        if ([UIBarButtonItem instancesRespondToSelector:@selector(setBackgroundImage:forState:barMetrics:)]) {
            // 普通的UIBarButtonItem
            [[UIBarButtonItem appearance] setBackgroundImage:[UIImage imageNamed:@"barbuttonItem_transparent_bg"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:[[UIBarButtonItem appearance] backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackgroundImage:[[UIBarButtonItem appearance] backgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
            // 返回按钮的UIBarButtonItem
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"btn_nav_native_back"] stretchableImageWithLeftCapWidth:16 topCapHeight:21] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIBarButtonItem appearance] backButtonBackgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
            [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIBarButtonItem appearance] backButtonBackgroundImageForState:UIControlStateNormal barMetrics:UIBarMetricsDefault] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
            // 返回按钮文字offset
            if (IOS_VERSION < 6) {
                [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(6, -6) forBarMetrics:UIBarMetricsDefault];
                [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(6, -4.5) forBarMetrics:UIBarMetricsLandscapePhone];
                [[UIBarButtonItem appearance] setBackButtonBackgroundVerticalPositionAdjustment:4 forBarMetrics:UIBarMetricsDefault];
                [[UIBarButtonItem appearance] setBackButtonBackgroundVerticalPositionAdjustment:4.5 forBarMetrics:UIBarMetricsLandscapePhone];
            } else {
                [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(6, 0) forBarMetrics:UIBarMetricsDefault];
                [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(6, -3.5) forBarMetrics:UIBarMetricsLandscapePhone];
                [[UIBarButtonItem appearance] setBackButtonBackgroundVerticalPositionAdjustment:1 forBarMetrics:UIBarMetricsDefault];
                [[UIBarButtonItem appearance] setBackButtonBackgroundVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsLandscapePhone];
            }
            // 三态
            [[UIBarButtonItem appearance] setTitleTextAttributes:UIBarButtonItemNormal forState:UIControlStateNormal];
            [[UIBarButtonItem appearance] setTitleTextAttributes:UIBarButtonItemHighlighted forState:UIControlStateHighlighted];
            [[UIBarButtonItem appearance] setTitleTextAttributes:UIBarButtonItemDisabled forState:UIControlStateDisabled];
        }
    }
}

@end


#pragma mark - TTNavigationButton

@interface TTNavigationButton()

@property(nonatomic,assign) TTNavigationButtonType type;
+ (UIBarButtonItem *)systemBarButtonItemWithType:(TTNavigationButtonType)type title:(NSString *)title target:(id)target action:(SEL)selector;

@end

@implementation TTNavigationButton

- (id)initWithType:(TTNavigationButtonType)type
{
    return [self initWithType:type title:nil];
}

- (id)initWithType:(TTNavigationButtonType)type title:(NSString *)title
{
    if (self = [super initWithFrame:CGRectZero]) {
        self.type = type;
        [self setTitle:title forState:UIControlStateNormal];
        [self renderButtonStyle];
        [self sizeToFit];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image
{
    if (self = [self initWithType:TTNavigationButtonTypeIcon]) {
        [self setImage:image forState:UIControlStateNormal];
        [self sizeToFit];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize contentSize = CGSizeMake(0, TTNavigationButtonHeight);
    switch (self.type) {
        case TTNavigationButtonTypeNormal:
        case TTNavigationButtonTypeBold:
        case TTNavigationButtonTypeIcon:
        case TTNavigationButtonTypeBack:
            return [super sizeThatFits:size];
        default:
            break;
    }
    return contentSize;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    float alpha = highlighted ? .3 : 1;
    alpha = self.enabled ? alpha : .3;
    self.imageView.alpha = alpha;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    float alpha = enabled ? 1 : .3;
    self.imageView.alpha = alpha;
}

- (void)renderButtonStyle
{
    [self.titleLabel setFont:TTButtonFont];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    
    [self setTitleColor:TintColorNormal forState:UIControlStateNormal];
    [self setTitleColor:TintColorHighlighted forState:UIControlStateHighlighted];
    [self setTitleColor:TintColorDisabled forState:UIControlStateDisabled];
    
    [self setContentMode:UIViewContentModeCenter];
    
    switch (self.type) {
        case TTNavigationButtonTypeNormal:
            break;
        case TTNavigationButtonTypeIcon:
            break;
        case TTNavigationButtonTypeBold:
            [self.titleLabel setFont:TTButtonFontBold];
            break;
        case TTNavigationButtonTypeBack:
            [self setImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
            if (IOS_VERSION < 7) {
                [self setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
            }
            break;
        default:
            break;
    }
    
}

+ (UIBarButtonItem *)backBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector
{
    TTNavigationButton *button = [[TTNavigationButton alloc] initWithType:TTNavigationButtonTypeBack title:title];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonItemWithNavigationButton:(TTNavigationButton *)button target:(id)target action:(SEL)selector
{
    if ([UIBarButtonItem instancesRespondToSelector:@selector(setBackgroundImage:forState:barMetrics:)]) {
        return [TTNavigationButton systemBarButtonItemWithType:button.type title:button.titleLabel.text target:target action:selector];
    }
    return nil;
}

+ (UIBarButtonItem *)barButtonItemWithType:(TTNavigationButtonType)type title:(NSString *)title target:(id)target action:(SEL)selector
{
    if ([UIBarButtonItem instancesRespondToSelector:@selector(setBackgroundImage:forState:barMetrics:)]) {
        return [TTNavigationButton systemBarButtonItemWithType:type title:title target:target action:selector];
    }
    return nil;
}

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector
{
    if ([UIBarButtonItem instancesRespondToSelector:@selector(setBackgroundImage:forState:barMetrics:)]) {
        return [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:selector];
    }
    return nil;
}

+ (UIBarButtonItem *)systemBarButtonItemWithType:(TTNavigationButtonType)type title:(NSString *)title target:(id)target action:(SEL)selector
{
    switch (type) {
        case TTNavigationButtonTypeBack:
            return nil;
            break;
        case TTNavigationButtonTypeBold:
        {
            UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:(id)target action:selector];
            [buttonItem setTitleTextAttributes:@{UITextAttributeFont:TTButtonFontBold} forState:UIControlStateNormal];
            if (IOS_VERSION < 7) {
                [buttonItem setTitleTextAttributes:UIBarButtonItemBlodNormal forState:UIControlStateNormal];
            }
            return buttonItem;
        }
            break;
        default:
        {
            UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:(id)target action:selector];
            return barButtonItem;
        }
            break;
    }
}

@end
