//
//  Person.h
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtocolTest1.h"
#import "ProtocolTest2.h"

@interface Person : NSObject <ProtocolTest1,ProtocolTest2>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

- (NSString *)getName;
- (NSString *)getAge;

+ (void)classMethodTest;
@end
