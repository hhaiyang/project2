//
//  XEViewController.m
//  SSB01
//
//  Created by momode on 16/7/16.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XEViewController.h"
#import "XETableViewController.h"
@interface XEViewController ()
@property (nonatomic,strong)UIWebView * webView;
@end

@implementation XEViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"小额贷款";
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
    XETableViewController *xyk=[[XETableViewController alloc]init];
    xyk.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50);
    [self addChildViewController:xyk];
    [self.view addSubview:xyk.view];
    
    
    
    //UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, self.view.frame.size.height-50)];
    //
    
    
    
    
    
}
-(void)butClick
{
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.rong360.com/express?from=sem21&utm_source=xinhe&utm_medium=dk&utm_campaign=app"]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];
    NSLog(@"lianjie");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
