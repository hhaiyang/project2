//
//  LoginViewController.m
//  SSB01
//
//  Created by 郑文青 on 16/5/30.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "PasswdViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *userPasswdTf;

@end

@implementation LoginViewController
- (IBAction)clickLoginBtn:(id)sender
{
    NSLog(@"点击登录");
    if (self.userNameTf.text.length == 0&&self.userPasswdTf.text.length == 0) {
        [MBProgressHUD showError:@"用户名或密码不能为空"];
    }else{
        [MBProgressHUD showSuccess:@"登录成功"];
    }
}
- (IBAction)clickRegisterbtn:(id)sender
{
    RegisterViewController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self.navigationController pushViewController:rvc animated:YES];
}
- (IBAction)clickForgetPasswdBtn:(id)sender
{
   
    PasswdViewController *pvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PasswdViewController"];
    [self.navigationController pushViewController:pvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
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
