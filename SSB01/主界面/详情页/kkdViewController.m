//
//  kkdViewController.m
//  SSB01
//
//  Created by momode on 16/7/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "kkdViewController.h"

@interface kkdViewController ()
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation kkdViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kRGBColor(240, 240, 240, 1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pahpBtn:(UIButton *)sender {
    
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://weixin.cashbus.com/#/events/promo/7601"]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
