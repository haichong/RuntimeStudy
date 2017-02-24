//
//  UIButton+Count.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "UIButton+Count.h"
#import <objc/runtime.h>
#import "Tool.h"

@implementation UIButton (Count)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        
        SEL oriSEL = @selector(sendAction:to:forEvent:);
        Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
        
        SEL cusSel = @selector(mySendAction:to:forEvent:);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSel);
        
        BOOL addSuc = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSuc) {
            class_replaceMethod(selfClass, cusSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    [[Tool shareInstance] countClicks];
    [super sendAction:action to:target forEvent:event];
}
@end
