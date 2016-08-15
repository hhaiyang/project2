//
//  xjbsViewController.m
//  SSB01
//
//  Created by momode on 16/6/17.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "xjbsViewController.h"

@interface xjbsViewController ()
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation xjbsViewController

- (IBAction)clickHDBtn:(id)sender {
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://weixin.cashbus.com/#/events/promo/7601"]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//super.hidesBottomBarWhenPushed = YES;
    self.view.backgroundColor=kRGBColor(240, 240, 240, 1.0);
    
   

    
        self.title=@"现金巴士";
    
//       self.navigationController.toolbarHidden = YES;
    
    
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
   
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
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
