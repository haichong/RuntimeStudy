//
//  Tool.h
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

@property (nonatomic, assign) NSInteger count;

+ (instancetype)shareInstance;
- (void)countClicks;
@end
