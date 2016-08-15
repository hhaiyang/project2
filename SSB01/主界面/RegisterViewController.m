//
//  RegisterViewController.m
//  SSB01
//
//  Created by 郑文青 on 16/5/30.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *telPhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwdTF;
@property (weak, nonatomic) IBOutlet UITextField *againPasswdTF;

@end

@implementation RegisterViewController
- (IBAction)clickCodeBtn:(id)sender
{
    NSLog(@"点中了获取验证码");
}
- (IBAction)clickFuwuxieyiBtn:(id)sender
{
    NSLog(@"点中了服务协议");
}
- (IBAction)clickRegisterBtn:(id)sender
{
    if([self.telPhoneTF.text isEqualToString:@""]&&[self.codeTF.text isEqualToString:@""]&& [self.passwdTF.text isEqualToString:@""] && [self.againPasswdTF.text isEqualToString:@""]){
        [MBProgressHUD showError:@"注册信息不能为空"];
    }else{
        [MBProgressHUD showSuccess:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    NSLog(@"点中了注册按钮");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
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
