//
//  Student.h
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *stuID;
@property (nonatomic, strong) NSString *score;

@end
