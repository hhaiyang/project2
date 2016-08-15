//
//  WJMMViewController.m
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "WJMMViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"

#import "LiangTools.h"


@interface WJMMViewController ()
{
    NSString *code;
}


@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdOnceAgainTextField;

@end

@implementation WJMMViewController

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"忘记密码";
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)HQYZMbtn:(UIButton *)sender {
    NSLog(@"获取验证码");
    if ([LiangTools ba_isMobileNumber:_phoneNumberTextField.text]) {//是否是正确的手机号
        NSURLRequest *request = [LiangTools getRequestWithMethod:@"ChuangLan" forParameter:@{@"strCellNumber":_phoneNumberTextField.text,@"strType":@"1"} withManner:@"POST"];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"获取验证码错误：%@",error);
                return ;
            }
            
            NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
            
            NSDictionary *result = [LiangTools getWebServiceXMLResult:xml xpath:@"ChuangLanResult"];
            
            code = result[@"text"];
            if ([code isEqualToString:@"3"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的手机号还未被注册" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
                    //点击确定
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            }else if(code.length>2)code = [result[@"text"] substringWithRange:NSMakeRange(2, 6)];
        }];
        [task resume];
    }
    
    
}

    
    


- (IBAction)MMCZbtn:(UIButton *)sender {
    NSLog(@"密码重置");
    if(![LiangTools ba_isPhoneNumber:_phoneNumberTextField.text])
    {
        NSLog(@"手机号有误！");
        [MBProgressHUD showError:@"手机号填写错误"];
        return;
    }
    if( _codeTF.text.length == 0 || ![_codeTF.text isEqualToString:code]  || [_codeTF.text isEqualToString:@""])
    {
        NSLog(@"验证码有误！");
        [MBProgressHUD showError:@"验证码填写错误"];
        return;
    }
    if(![LiangTools checkPassword:_pwdTextField.text] || ![LiangTools checkPassword:_pwdOnceAgainTextField.text])
    {
        NSLog(@"密码有误！");
        [MBProgressHUD showError:@"重置的密码需数字和字母结合"];
        return;
    }
    if(![_pwdTextField.text isEqualToString:_pwdOnceAgainTextField.text])
    {
        NSLog(@"两次密码不一致！");
        [MBProgressHUD showError:@"两次密码填写不一致"];
        return;
    }
    
    [self requestForWJMM];
}


- (void)requestForWJMM
{
    // PassWordReset
    NSMutableDictionary *dict = [NSMutableDictionary new];
    NSDictionary *userAndPass = @{
                                  @"userName":_phoneNumberTextField.text,
                                  @"strNewPassWord":_pwdTextField.text,
                                  //                                  @"code":_codeTF.text
                                  };
    [dict setObject:userAndPass forKey:@"PassWordReset"];
    
    NSDictionary *param = @{
                            @"strNew":[LiangTools dictionaryToJson:dict]
                            };
    
    NSURLRequest *request = [LiangTools getRequestWithMethod:@"PassWordReset" forParameter:userAndPass withManner:@"POST"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
            
            NSDictionary *result = [LiangTools getWebServiceXMLResult:xml xpath:@"PassWordResetResult"];
            NSString *status = result[@"text"];
            if ([status isEqualToString:@"0"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"成功" message:@"密码重置成功，请登录" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
                    //点击确定
                    [self.navigationController popViewControllerAnimated:YES];
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            }else{
                [MBProgressHUD showError:@"密码重置失败"];
            }
        }
    }];
    [task resume];

//     [self.navigationController popViewControllerAnimated:YES];
    
    
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
