//
//  FirstViewController.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "FirstViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       
    Person *tomcat = [Person new];
    unsigned int count;
    NSLog(@"\n1.获得属性列表");
    //  1.get describes of all properties (获得属性列表)
    objc_property_t *propertyList = class_copyPropertyList([tomcat class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
        const char *propertyName = property_getName(propertyList[i]);
        printf("property = %s\n",propertyName);
    }
    
    // 2.get describes of all methods (获得方法列表)
    NSLog(@"\n\n2.获得方法列表");
    Method *methodList = class_copyMethodList([tomcat class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
        SEL methodName = method_getName(methodList[i]);
        NSLog(@"methodName = %@",NSStringFromSelector(methodName));
    }
    
    // 3.get describes of all variables (获得成员变量列表)
    NSLog(@"\n\n3.获得成员变量列表");
    Ivar *ivarList = class_copyIvarList([tomcat class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
        const char *ivarNmae = ivar_getName(ivarList[i]);
        printf("ivarNmae = %s\n",ivarNmae);
        // 动态变量控制
        object_setIvar(tomcat, ivarList[i], @"哈哈，你被我改了");
    }
    NSLog(@"动态变量控制: name = %@",tomcat.name);
    
    //4.get describes of all protocols adopted by a class (获得当前对象遵守的协议列表)
    NSLog(@"\n\n4.获得协议列表");
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([tomcat class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
        const char *protocolNmae = protocol_getName(protocolList[i]);
        printf("protocolNmae = %s\n",protocolNmae);
    }
    
    //5. 通过方法名获得类方法
    Class personClass = object_getClass([Person class]);
    SEL classSel = @selector(classMethodTest);
    Method classMethod = class_getInstanceMethod(personClass, classSel);
    
    //6. 通过方法名获得实例方法
    SEL objSel1 = @selector(getName);
    Method objMethod1 = class_getInstanceMethod([tomcat class], objSel1);
    SEL objSe2 = @selector(getAge);
    Method objMethod2 = class_getInstanceMethod([tomcat class], objSe2);
    
    //7. 交换两个方法的实现
    NSLog(@"\n\n交换两个方法的实现");
    NSLog(@"交换之前 --- %@", [tomcat getName]);
    method_exchangeImplementations(objMethod1, objMethod2);
    NSLog(@"交换之后 --- %@", [tomcat getName]);
    
    //8. 动态添加方法
    NSLog(@"\n\n添加方法");
    BOOL addSuc = class_addMethod([tomcat class], @selector(addNewMethod), (IMP)addMethodTest, "v@:");
    if (addSuc) {
        
        [tomcat performSelector:@selector(addNewMethod)];
    }else {
        NSLog(@"Sorry,I donot know!");
    }
    
    //9. 替换原方法的实现
    NSLog(@"\n\n替换原方法的实现");
    SEL replaceSel = @selector(replaceOther);
    Method replaceMethod = class_getInstanceMethod([self class],replaceSel);
    class_replaceMethod([tomcat class], objSel1, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    NSLog(@"%@",[tomcat getName]);
    
}

void addMethodTest (id self, SEL _cmd){
    
    NSLog(@"sel = %@",NSStringFromSelector(_cmd));
    NSLog(@"我是新来的！");
}

- (NSString *)replaceOther{
        
        return @"I replaced you";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
