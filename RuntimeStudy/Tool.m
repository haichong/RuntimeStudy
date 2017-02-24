//
//  Tool.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "Tool.h"

@implementation Tool

static id _instance;
+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[Tool alloc] init];
    });
    
    return _instance;
}

- (void)countClicks {
    
    _count += 1;
    NSLog(@"您点击了%ld次",_count);
}
@end
