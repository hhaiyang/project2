//
//  nwdViewController.m
//  SSB01
//
//  Created by momode on 16/7/20.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "nwdViewController.h"

@interface nwdViewController ()
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation nwdViewController
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
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.niwodai.com/index.do?method=ac&artId=3800000713376124&nwd_ext_aid=3000001165652389&source_id="]];
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
