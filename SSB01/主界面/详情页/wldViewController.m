//
//  wldViewController.m
//  SSB01
//
//  Created by momode on 16/6/17.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "wldViewController.h"

@interface wldViewController ()
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation wldViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

- (IBAction)clickbtn:(id)sender {
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.wolaidai.com/staff/public.html?channel=bd_prm_xhp_00000001"]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kRGBColor(240, 240, 240, 1.0);
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
