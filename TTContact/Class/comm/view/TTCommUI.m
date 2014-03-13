//
//  TTCommUI.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTCommUI.h"

@implementation TTCommUI

#pragma mark - LoadingView Creater
+ (UIActivityIndicatorView *)loadingViewWithFrame:(CGRect)frame
{
    CGPoint center = CGPointMake(frame.origin.x + (frame.size.width) / 2, frame.origin.y + (frame.size.height) / 2);
    return [TTCommUI loadingViewWithCenter:center size:frame.size];
}

+ (UIActivityIndicatorView *)loadingViewWithCenter:(CGPoint)center
{
    return [TTCommUI loadingViewWithCenter:center size:CGSizeMake(LoadingViewSystemSize, LoadingViewSystemSize)];
}

+ (UIActivityIndicatorView *)loadingViewWithCenter:(CGPoint)center size:(CGSize)size
{
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loadingView setCenter:center];
    [loadingView setTransform:CGAffineTransformMakeScale(size.width / LoadingViewSystemSize, size.width / LoadingViewSystemSize)];
    [loadingView startAnimating];
    return loadingView;
}

@end
