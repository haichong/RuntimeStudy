//
//  Person.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (NSString *)getName {
    
    return @"I am Tomcat";
}
- (NSString *)getAge {
    
    return @"I will be 18 years old forever";
}

+ (void)classMethodTest {
    
    NSLog(@"This is a class method");
}

@end
