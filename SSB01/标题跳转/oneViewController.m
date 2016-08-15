//
//  oneViewController.m
//  SN002
//
//  Created by momode on 16/5/26.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "oneViewController.h"
#import "MainViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface oneViewController ()<UIWebViewDelegate>
/** 属性 */
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation oneViewController
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.delegate =self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.bottom.right.mas_equalTo(0);
        }];
        
    }
    return _webView;
}
-(instancetype)initWithWebURLStr:(NSString *)WebURLStr
{
    if (self = [super init]) {
        self.WebURLStr = WebURLStr;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"现金贷";
    //设置webview代理,跟踪加载请求,
    self.webView.delegate = self;
    
    //网页内容缩小到适应整个设备屏幕
    self.webView.scalesPageToFit = YES;
    
    //检测网页中的各种特殊的字符串 比如:电话,网址,能自动识别,在用户长按时,从底部弹出菜单操作
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;//全部都识别
    NSURL *webURL = [NSURL URLWithString:self.WebURLStr];
    [self.webView loadRequest:[NSURLRequest requestWithURL:webURL]];
    
//    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
//    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
//    self.navigationController.navigationBar.titleTextAttributes = dict;
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    
    
}
//- (void)loadWebPageWithString:(NSString*)urlString
//{
//    NSURL *url =[NSURL URLWithString:urlString];
//    
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
//    
//}



//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
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
