//
//  ViewController.m
//  RuntimeStudy
//
//  Created by FuHang on 2017/2/23.
//  Copyright © 2017年 付航. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation ViewController

- (NSArray *)datasource {
    
    if (!_datasource) {
        
        _datasource = [NSArray arrayWithObjects:@"1.runtime的常用方法",@"2.拦截并替换方法***",@"3.实现NSCoding的自动归档和解档***", nil];
    }
    
    return _datasource;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"runtime";
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    cell.textLabel.text = self.datasource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
            vc = [FirstViewController new];
            break;
        case 1:
            vc = [SecondViewController new];
            break;
        case 2:
            vc = [ThirdViewController new];
            break;
        default:
            vc = [FourthViewController new];
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
