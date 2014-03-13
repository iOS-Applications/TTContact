//
//  TTNavigationTitleView.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTNavigationTitleView.h"
#import "TTCommUI.h"

@interface TTNavigationTitleView ()

@property(nonatomic,strong,readwrite) UILabel *textLabel;
@property(nonatomic,strong,readwrite) UILabel *subLabel;
@property(nonatomic,assign) BOOL debugTouchable;

@end

@implementation TTNavigationTitleView

- (id)initWithType:(TTNavigationTitleViewType)type
{
    return [self initWithType:type title:nil subTitle:nil];
}

- (id)initWithType:(TTNavigationTitleViewType)type title:(NSString *)title
{
    return [self initWithType:type title:title subTitle:nil];
}

- (id)initWithType:(TTNavigationTitleViewType)type title:(NSString *)title subTitle:(NSString *)subTitle
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 0, 44)])
    {
        // 指定初始值<0，以触发setTitleViewType:时的按需更新
        _type = -1;
        _status = -1;
        self.shouldLayoutSubviews = NO;
        
        // 主标题
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
        [self.textLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        NavigationTitleLabelSet(self.textLabel);
        [self addSubview:self.textLabel];
        
        // 副标题
        self.subLabel = [[UILabel alloc] initWithFrame:self.textLabel.frame];
        NavigationTitleLabelSet(self.subLabel);
        [self addSubview:self.subLabel];
        
        // 根据type决定是否要初始化箭头及相关元素
        [self setTitleViewType:type];

        self.textLabel.text = title;
        self.subLabel.text = subTitle;
        
        self.debugTouchable = NO;
    }
    return self;
}

- (void)setNeedsLoadingView:(BOOL) needed
{
    _isLoadingViewNeeded = needed;
    if (_isLoadingViewNeeded) {
        if (_loadingView == nil) {
            _loadingView = [TTCommUI loadingViewWithFrame:CGRectMake(0, (self.frame.size.height - NavigationTitleViewLoadingSize) / 2, NavigationTitleViewLoadingSize, NavigationTitleViewLoadingSize)];
            [_loadingView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        }
        [self showLoadingView:NO];
    } else {
        [_loadingView removeFromSuperview];
        _loadingView = nil;
    }
}

- (void)setTitleViewType:(TTNavigationTitleViewType) type
{
    // 按需更新
    if (_type != type) {
        _type = type;
        if (_type == TTNavigationTitleViewTypeButton) {
            _arrowImageDown = [UIImage imageNamed:@"icon_nav_arrow"];
            _arrowViewSize = _arrowImageDown.size;
            [_arrowView removeFromSuperview];
            _arrowView = [[UIImageView alloc] initWithImage:_arrowImageDown];
            [_arrowView setContentMode:UIViewContentModeCenter];
            [self addSubview:_arrowView];
            [self setUserInteractionEnabled:YES];
            _status = TTNavigationTitleViewStatusNormal;
            [self addTarget:self action:@selector(handleTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            // 销毁与箭头有关的资源
            _arrowViewSize = CGSizeZero;
            [_arrowView removeFromSuperview];
            _arrowView = nil;
            [self setUserInteractionEnabled:NO];
            [self removeTarget:self action:@selector(handleTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self refreshLayout];
    }
}

- (void)setTitle:(NSString *) title
{
    [self.textLabel setText:title];
    [self refreshLayout];
}

- (void)setTitleTouchableForDebug
{
    self.debugTouchable = YES;
    [self setUserInteractionEnabled:YES];
    [self addTarget:self action:@selector(handleTitleTouchEvent:) forControlEvents:UIControlEventTouchDownRepeat];
}

- (void)handleTitleTouchEvent:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:handleTouchEventWithStatus:)]) {
        [self.delegate titleView:self handleTouchEventWithStatus:_status];
    }
}

- (void)setSubTitle:(NSString *) subTitle
{
    [self.subLabel setText:subTitle];
    [self refreshLayout];
}

- (void)showLoadingView:(BOOL) isShow
{
    if (_isLoadingViewShow != isShow) {
        if (isShow) {
            [self addSubview:_loadingView];
        } else {
            [_loadingView removeFromSuperview];
        }
        _isLoadingViewShow = isShow;
    }
}

- (void) refreshLayout
{
    if (IOS_VERSION < 6 || self.shouldLayoutSubviews) {
        [self sizeToFit];
        [self setNeedsLayout];
    }
}

- (void)sizeToFit
{
    [super sizeToFit];
}

- (CGSize)sizeForContent
{
    CGFloat arrowViewMarginLeft = (_type == TTNavigationTitleViewTypeButton) ? NavigationTitleViewArrowMarginLeft : 0;
    CGFloat titleLabelContentWidth = [self.textLabel.text sizeWithFont:self.textLabel.font].width;
    CGFloat subtitleLabelContentWidth = [self.subLabel.text sizeWithFont:self.subLabel.font].width;
    CGFloat loadingViewSpace = _isLoadingViewNeeded ? NavigationTitleViewLoadingSize + 3 : 0;
    CGFloat fullContentWidth = _arrowViewSize.width + arrowViewMarginLeft + titleLabelContentWidth + subtitleLabelContentWidth + loadingViewSpace * 2;
    return CGSizeMake(fullContentWidth, CGRectGetHeight(self.frame));
}

// sizeThatFits:应该返回根据内容计算出来的完整大小，NavigationBar会衡量这个完整大小是否超出NavigationBar剩余可用空间，若超出则将titleView大小限制在可用空间内，若不超出则使用当前的完整大小。
- (CGSize)sizeThatFits:(CGSize)size
{
    return [self sizeForContent];
}

// 当titleView的frame变化时，navigationBar会判断新宽度如果小于等于老宽度，则不会改变titleView的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    CGSize contentSize = [self sizeForContent];
    contentSize.width = MIN(size.width, contentSize.width);
    CGFloat offsetX = fabs((contentSize.width - size.width) / 2);
    
    CGFloat subtitleLabelContentWidth = [self.subLabel.text sizeWithFont:self.subLabel.font].width;
    CGFloat loadingViewSpace = _isLoadingViewNeeded ? NavigationTitleViewLoadingSize + 3 : 0;
    
    // 布局原则是优先保证箭头、subtitle、loading的完整显示，再显示title，所以按从右往左的顺序做相对布局
    // 注意如果需要显示loading的话，为了保证loading的显/隐不会造成titleView的文字跳动，因此布局时就直接预留左右相同的空间给loading
    
    // 因为如果当前titleView不需要箭头的话，_arrowView = nil，_arrowView.frame全都是0，所以就用一个额外的CGRect变量来保存_arrowView的frame
    CGRect arrowViewFrame = CGRectMake(contentSize.width - loadingViewSpace - _arrowViewSize.width, (contentSize.height - _arrowViewSize.height) / 2, _arrowViewSize.width, _arrowViewSize.height);
    [_arrowView setFrame:arrowViewFrame];
    
    [self.subLabel setFrame:CGRectMake(arrowViewFrame.origin.x - subtitleLabelContentWidth, 0, subtitleLabelContentWidth, contentSize.height)];
    [self.textLabel setFrame:CGRectMake(loadingViewSpace, 0, self.subLabel.frame.origin.x - loadingViewSpace, contentSize.height)];
    
    if (_isLoadingViewNeeded) {
        _loadingView.frame = CGRectSetXY(_loadingView.frame, offsetX, (contentSize.height - CGRectGetHeight(_loadingView.frame)) / 2);
    }
    _arrowView.frame = CGRectSetX(_arrowView.frame, CGRectGetMinX(_arrowView.frame) + offsetX);
    _subLabel.frame = CGRectSetX(_subLabel.frame, CGRectGetMinX(_subLabel.frame) + offsetX);
    _textLabel.frame = CGRectSetX(_textLabel.frame, CGRectGetMinX(_textLabel.frame) + offsetX);
}

- (void) setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (!self.debugTouchable) {
        [self.textLabel setHighlighted:highlighted];
        [self.subLabel setHighlighted:highlighted];
        [_arrowView setHighlighted:highlighted];
        
        CGFloat alpha = highlighted ? .5 : 1;
        [self.textLabel setAlpha:alpha];
        [self.subLabel setAlpha:alpha];
        [_arrowView setAlpha:alpha];
    }
}

- (void) setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (_type == TTNavigationTitleViewTypeButton) {
        CGFloat alpha = enabled ? 1 : .5;
        [_arrowView setAlpha:alpha];
    }
}

#pragma mark - Event Action

- (void)handleTouchEvent:(id)sender
{
    // 非TTNavigationTitleViewTypeButton类型不响应点击事件
    if (_type != TTNavigationTitleViewTypeButton) return;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:handleTouchEventWithStatus:)]) {
        [self.delegate titleView:self handleTouchEventWithStatus:_status];
    }
}

- (void)setStatusToNormal
{
    [self setArrowNormal];
}
- (void)setStatusToActived
{
    [self setArrowActived];
}

- (void)setArrowActived
{
    // 当前是Normal，将要变成Actived
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:willStatusChanged:)]) {
        [self.delegate titleView:self willStatusChanged:TTNavigationTitleViewStatusActived];
    }
    [UIView animateWithDuration:.3 delay:0 options:TTAnimationCurveOut animations:^{
        // transform的正数值理应是逆时针，但这里如果用M_PI就变成顺时针了
        _arrowView.transform = CGAffineTransformMakeRotation(3.14);
    } completion:^(BOOL finished) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:didStatusChanged:)]) {
            [self.delegate titleView:self didStatusChanged:TTNavigationTitleViewStatusActived];
        }
        
    }];
    
    _status = TTNavigationTitleViewStatusActived;
}
- (void)setArrowNormal {
    // 当前是Actived，将要变成Normal
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:willStatusChanged:)]) {
        [self.delegate titleView:self willStatusChanged:TTNavigationTitleViewStatusNormal];
    }
    [UIView animateWithDuration:.3 delay:0 options:TTAnimationCurveIn animations:^{
        // transform的正数值理应是逆时针，但这里如果用M_PI就变成顺时针了
        _arrowView.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(titleView:didStatusChanged:)]) {
            [self.delegate titleView:self didStatusChanged:TTNavigationTitleViewStatusNormal];
        }
        
    }];
    
    _status = TTNavigationTitleViewStatusNormal;
}

- (void)changeStatus {
}

@end
