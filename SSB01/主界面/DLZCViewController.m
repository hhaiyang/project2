//
//  DLZCViewController.m
//  SSB01
//
//  Created by momode on 16/6/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "DLZCViewController.h"
#import "ZCViewController.h"
#import "WJMMViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "TXViewController.h"
#import "MYViewController.h"
#import "XGMMViewController.h"

@interface DLZCViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;




@end

@implementation DLZCViewController

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    _username.text = @"18237119367";
//    _password.text = @"123456";

    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"登录";
    
    //   self.navigationController.toolbarHidden = NO;

    

    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];

}
- (IBAction)DLbtn:(UIButton *)sender {
    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"GeRenGet" paramNames:@[@"strCellNumber",@"strPassWord"] paramValues:[NSArray arrayWithObjects:_username.text,_password.text, nil] success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"33333333333%@",dic);
        NSString * result = dic[@"soap:Body"][@"GeRenGetResponse"][@"GeRenGetResult"];
        if([result isEqualToString:@"1"]){
            NSLog(@"提示登陆失败");
            [LiangTools showToastWithContent:@"登陆失败"];
        }else{
            NSLog(@"提示登陆登陆成功，并把登陆信息存入本地");
            [LiangTools showToastWithContent:@"登陆成功"];
            NSData * data = [result dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            //把用户信息存入userDefault
            [[NSUserDefaults standardUserDefaults] setValue:resultDic[@"Geren"] forKey:@"userInfoDic"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"resultDic%@",resultDic);
//            NSLog(@"result%@",result);
//            NSLog(@"data%@",data);
//            NSLog(@"resultDic%@",resultDic);
//

            //回到主线程进行UI操作，0.5秒后跳出当前页面
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
                
                if (self.block) {
                    self.block(_username.text);
                }
            });
            
        }
    }failure:^(NSError *error) {
        [LiangTools showToastWithContent:@"请求数据失败"];
    }];
   
//    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)ZCbtn:(UIButton *)sender {
    
    NSLog(@"注册");
    ZCViewController *tx=[self.storyboard instantiateViewControllerWithIdentifier:@"ZCViewController"];
    [self.navigationController pushViewController:tx animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;

    
}


- (IBAction)WJMMbtn:(UIButton *)sender {
    
    NSLog(@"忘记密码");
    WJMMViewController *tx=[self.storyboard instantiateViewControllerWithIdentifier:@"WJMMViewController"];
    [self.navigationController pushViewController:tx animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;

    
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
