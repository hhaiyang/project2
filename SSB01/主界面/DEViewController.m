//
//  DEViewController.m
//  SSB01
//
//  Created by momode on 16/7/16.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "DEViewController.h"
#import "DETableViewController.h"

@interface DEViewController ()

@end

@implementation DEViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"大额贷款";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UILabel * label=[UILabel new];
    label.backgroundColor=[UIColor lightGrayColor];
    label.frame=CGRectMake(0, self.view.frame.size.height-50-64, self.view.frame.size.width, 0.5);
    
    [self.view addSubview:label];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(30, self.view.frame.size.height-50-64+10-2.5, self.view.frame.size.width-60, 35);
    [button setTitle:@"还没有找到合适的产品?来这里看看" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    button.backgroundColor=[UIColor blueColor];
    
    [button addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    //
    DETableViewController *xyk=[[DETableViewController alloc]init];
    xyk.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50);
    [self addChildViewController:xyk];
    [self.view addSubview:xyk.view];

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
