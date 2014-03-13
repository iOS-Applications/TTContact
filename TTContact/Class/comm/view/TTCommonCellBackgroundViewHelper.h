//
//  TTCommonCellBackgroundViewHelper.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTCommTableViewCell.h"
#import "TTCommTableView.h"

typedef NS_ENUM(NSInteger, CommonCellBackgroundViewType) {
    CommonCellBackgroundViewTypeGroupFirst = 6,
    CommonCellBackgroundViewTypeGroupMiddle,
    CommonCellBackgroundViewTypeGroupLast,
    CommonCellBackgroundViewTypeGroupSingle,
    CommonCellBackgroundViewTypePlainNormal,
    CommonCellBackgroundViewTypePlainNotInLastSectionAndLastInSection,
    CommonCellBackgroundViewTypeGroupFirstHighlighted = 12,
    CommonCellBackgroundViewTypeGroupMiddleHighlighted,
    CommonCellBackgroundViewTypeGroupLastHighlighted,
    CommonCellBackgroundViewTypeGroupSingleHighlighted,
    CommonCellBackgroundViewTypePlainNormalHighlighted,
    CommonCellBackgroundViewTypePlainNotInLastSectionAndLastInSectionHighlighted,
};

@interface TTCommonCellBackgroundViewHelper : NSObject

+ (NSInteger)CommonTableViewCellPositionToBackgroundViewType:(CommonTableViewCellPosition)position selected:(BOOL)selected;
+ (UIView *)backgroundViewForTableViewCell:(TTCommTableViewCell *)cell withType:(CommonCellBackgroundViewType)type;

@end
