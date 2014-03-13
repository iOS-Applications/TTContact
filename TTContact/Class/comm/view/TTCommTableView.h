//
//  TTCommTableView.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CommonTableViewCellPosition) {
    //group
    CommonTableViewCellPositionFirstInSection = 0,
    CommonTableViewCellPositionMiddleInSection,
    CommonTableViewCellPositionLastInSection,
    CommonTableViewCellPositionSingleInSection,
    // plain
    CommonTableViewCellPositionNormal,
    CommonTableViewCellPositionNotInLastSectionAndLastInSection
};

@interface TTCommTableView : UITableView

- (CommonTableViewCellPosition)getCellPositionInTableView:(UITableView *)tableView positionForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
