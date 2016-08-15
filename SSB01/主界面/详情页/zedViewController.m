//
//  zedViewController.m
//  SSB01
//
//  Created by momode on 16/6/22.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "zedViewController.h"

@interface zedViewController ()
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation zedViewController
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
- (IBAction)zedBtn:(UIButton *)sender {
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.10100000.com/m/daikuan/zed/index.html?utm_source=phmd-mdxjdxjdmd&utm_medium=mkt&utm_campaign=mkt&WT.mc_id=CXX-MDXJDXJDMD-&"]];
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
