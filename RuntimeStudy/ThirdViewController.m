//
//  ThirdViewController.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "ThirdViewController.h"
#import "Student.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// 归档
- (IBAction)encodeAction:(id)sender {
    
    Student *tomcat = [[Student alloc] init];
    tomcat.name = @"Tomcat";
    tomcat.stuID = @"666";
    tomcat.score = @"A";
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingString:@"tomcat.student"];
    [NSKeyedArchiver archiveRootObject:tomcat toFile:path];
}
// 解档
- (IBAction)decodeAction:(id)sender {

    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docPath stringByAppendingString:@"tomcat.student"];
    
    Student *tomcat = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"tomcat: name = %@,stuID  =%@,score = %@",tomcat.name,tomcat.stuID,tomcat.score);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
