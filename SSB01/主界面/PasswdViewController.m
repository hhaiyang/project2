//
//  PasswdViewController.m
//  SSB01
//
//  Created by 郑文青 on 16/5/30.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "PasswdViewController.h"

@interface PasswdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TelPhoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *againPasswdTF;
@property (weak, nonatomic) IBOutlet UITextField *passwdTF;

@end

@implementation PasswdViewController
- (IBAction)clickCodeBtn:(id)sender
{
    NSLog(@"点击获取验证码");
}
- (IBAction)clickResetPasswdBtn:(id)sender
{
    if([self.TelPhoneTF.text isEqualToString:@""]&&[self.codeTF.text isEqualToString:@""]&&[self.againPasswdTF.text isEqualToString:@""]&&[self.passwdTF.text isEqualToString:@""]){
        [MBProgressHUD showError:@"重置密码信息不能为空"];
    }else{
        [MBProgressHUD showSuccess:@"密码重置成功"];
    }
        
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"忘记密码";
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
