//
//  TTContactHelper.h
//  TTContact
//
//  Created by zhoonchen on 14-3-14.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface TTContactHelper : NSObject

// MD5
+ (NSString *)md5:(NSString *)str;

@end
