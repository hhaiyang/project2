//
//  ZCViewController.m
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "ZCViewController.h"
#import "ZCXYViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"

#import "LiangTools.h"

@interface ZCViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *enterPasswordTextField;

@end

@implementation ZCViewController{
    NSString *code;
}


- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"注册";
    
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)zcbtn:(UIButton *)sender {
    
    NSLog(@"注册");
    if ([self verify]) {
        NSMutableDictionary *dict = [NSMutableDictionary new];
        NSDictionary *userAndPass = @{
                                      @"username":_phoneNumberTextField.text,
                                      @"password":_passwordTextField.text
                                      };
        [dict setObject:userAndPass forKey:@"Register"];
        
        NSDictionary *param = @{
                                @"strNew":[LiangTools dictionaryToJson:dict]
                                };
        [self SubmitRegistration:param];
       
    }
    
    
    
    //[self.navigationController popViewControllerAnimated:YES];
    //返回值
    

}


- (IBAction)XYbtn:(UIButton *)sender {
    
    NSLog(@"xieyi");
    
    ZCXYViewController *tx=[self.storyboard instantiateViewControllerWithIdentifier:@"ZCXYViewController"];
    [self.navigationController pushViewController:tx animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    self.hidesBottomBarWhenPushed = YES;
    
   

}


- (IBAction)YZMbtn:(UIButton *)btn {
    NSLog(@"获取验证码");
   
    if ([LiangTools ba_isMobileNumber:_phoneNumberTextField.text]) {//是否是正确的手机号
        
        NSURLRequest *request = [LiangTools getRequestWithMethod:@"ChuangLan" forParameter:@{@"strCellNumber":_phoneNumberTextField.text,@"strType":@"0"} withManner:@"POST"];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"注册错误：%@",error);
                return ;
            }
            
            NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
            
            NSDictionary *ss = [LiangTools getWebServiceXMLResult:xml xpath:@"ChuangLanResult"];
            
            code = ss[@"text"];
            if ([code isEqualToString:@"3"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"此手机号码已经注册，请登录" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
                   //点击确定
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            }else if(code.length>2)code = [ss[@"text"] substringWithRange:NSMakeRange(2, 6)];
        }];
        [task resume];
        [self countdownForButton:btn];
    }
    
}
-(void)countdownForButton:(UIButton *)btn{
    __block int timeout = 59;
    /*! 倒计时时间 */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer2,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    /*! 每秒执行 */
    dispatch_source_set_event_handler(_timer2, ^{
        
        if(timeout <= 0)
        {
            /*! 倒计时结束，关闭 */
            dispatch_source_cancel(_timer2); dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
                
            });
        }
        else
        {
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            if ([strTime isEqualToString:@"0"])
            {
                strTime = [NSString stringWithFormat:@"%d", 60];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                // BALog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                btn.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer2);
}
-(BOOL)verify{
    if ([LiangTools ba_isMobileNumber:_phoneNumberTextField.text]) {
        if ([_codeTextField.text isEqualToString:code]) {
            if ([LiangTools checkPassword:_passwordTextField.text] && [LiangTools checkPassword:_enterPasswordTextField.text]) {
                if ([_passwordTextField.text isEqualToString:_enterPasswordTextField.text]) {
                    
                    //验证通过
                    return YES;
                    
                }else{
                    [MBProgressHUD showError:@"确认密码不一致！"];
                }
                
            }else{
                [MBProgressHUD showError:@"请输入6-18位包含字母的密码"];
            }
        }else{
            [MBProgressHUD showError:@"请输入正确的验证码"];
        }
    }else{
        [MBProgressHUD showError:@"请输入正确的手机号"];
    }

    return NO;
}
-(void)SubmitRegistration:(NSDictionary *)dict{
    NSURLRequest *request = [LiangTools getRequestWithMethod:@"GeRenAdd" forParameter:dict withManner:@"POST"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
            
            NSDictionary *result = [LiangTools getWebServiceXMLResult:xml xpath:@"GeRenAddResult"];
            NSString *status = result[@"text"];
            if ([status isEqualToString:@"0"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"成功" message:@"注册成功，请登录" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
                    //点击确定
                    [self.navigationController popViewControllerAnimated:YES];
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            }else{
                [MBProgressHUD showError:@"注册失败"];
            }
        }
    }];
    [task resume];
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
