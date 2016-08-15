//
//  ZDAddViewController.m
//  SSB01
//
//  Created by momode on 16/7/5.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "ZDAddViewController.h"
#import "ZDViewController.h"
#import "AddTableViewController.h"
#import "DateViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "LiangTools.h"
#import "HttpTool.h"
#import "DaiDodgeKeyboard.h"


#define kAlphaNum @"0123456789"


@interface ZDAddViewController ()<AddDelegate,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *payBackLabel;
@property (weak, nonatomic) IBOutlet UILabel *payBackTimeLabel;
@property (weak, nonatomic) IBOutlet UITextField *mouthPayTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
@property (weak, nonatomic) IBOutlet UITextField *currentTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *remark;

//@property (nonatomic,assign)NSNumber* n1;
@end

@implementation ZDAddViewController
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//        NSCharacterSet *cs;
//        cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
//        
//        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
//        
//        BOOL canChange = [string isEqualToString:filtered];
//        
//        
//        return (self.totalTextField.text.length>=11||self.currentTextField.text.length>=11||self.mouthPayTextField.text.length>=11||self.firstTextField.text.length>=11)?NO: canChange;
//       
//        
//   
//  
//}



-(void)viewWillAppear:(BOOL)animated
{
//    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
}
-(void)viewWillDisappear:(BOOL)animated
{
//    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _mouthPayTextField.delegate = self;
    _totalTextField.delegate = self;
    _currentTextField.delegate = self;
    _firstTextField.delegate = self;
    _remark.delegate = self;
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"手动记账";
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    _remark.text=@"账单详情";
    
}

- (IBAction)xuanzechanpin:(UIButton *)sender {
     AddTableViewController *ADDVC =[self.storyboard instantiateViewControllerWithIdentifier:@"AddTableViewController"];
     ADDVC.delegate = self;
    ADDVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ADDVC animated:YES];
}

-(void)getSelectedString:(NSString *)backStr
{
    self.huankuanpingtaiText.text = backStr;
   
    NSLog(@"接受到的:%@",backStr);
}

- (IBAction)xuanzeriqi:(UIButton *)sender
{
    DateViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DateViewController"];
    [dvc getStrBlock:^(NSString *dateStr) {
        self.huankuanriqiText.text = dateStr;
    }];
    dvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dvc animated:YES];
    
}
- (IBAction)baocun:(UIButton *)sender {
    NSLog(@"baocun");
    
    
//    _n1=[NSNumber numberWithFloat:[self.totalTextField.text floatValue]];
//    NSNumber *n2=[NSNumber new];
//    n2=[NSNumber numberWithFloat:[self.currentTextField.text floatValue]];
    NSLog(@"n1===%f,,,,,,n2====%f",[self.totalTextField.text floatValue],[self.currentTextField.text floatValue]);
    NSLog(@"总%@,,,,,,,已还%@",self.totalTextField.text,self.currentTextField.text);
    
    if ([self.currentTextField.text floatValue]<[self.totalTextField.text floatValue]) {
        
        
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              self.payBackLabel.text,@"payBackLabel",
                              self.payBackTimeLabel.text,@"payBackTimeLabel",
                              self.mouthPayTextField.text,@"mouthPayTextField",
                              self.totalTextField.text,@"totalTextField",
                              self.currentTextField.text,@"currentTextField",
                              self.firstTextField.text,@"firstTextField",
                              self.remark.text,@"remark",
                              nil];
      
        NSArray *keyarray = dict.allKeys;
        for (NSString *object in keyarray) {
            NSString *value = [dict objectForKey:object];
            if (value.length == 0 || value == nil) {
                if ([object isEqualToString:@"firstTextField"] || [object isEqualToString:@"remark"]) {
                    //可选项
                }else{
                    //必须项
                    UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"提示" message:@"信息不完整" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    [alertview show];
                   
                    
                    return ;
                }
            }
        }
        NSArray *paramNames = @[
                                @"userName",
                                @"ProductName",
                                @"LimitDate",
                                @"AmountPer",
                                @"periods",
                                @"PeriodNow",
                                @"fistPay",
                                @"Intruduction"];
        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] valueForKey:@"userInfoDic"];
        NSString *phone = nil;
        if (userInfo) {//已登录
            phone = [userInfo valueForKey:@"username"];
        }
        if (phone == nil || phone.length == 0) {
            return;
        }
        NSLog(@"%@",phone);
        NSArray *paramValues = [NSArray arrayWithObjects:
                                phone,
                                self.payBackLabel.text,
                                self.payBackTimeLabel.text,
                                self.mouthPayTextField.text,
                                self.totalTextField.text,
                                self.currentTextField.text,
                                self.firstTextField.text,
                                self.remark.text,nil];
        NSDictionary *paramdict = [NSDictionary dictionaryWithObjects:paramValues forKeys:paramNames];
        NSDictionary *param = @{@"strZD":[LiangTools dictionaryToJson:@{@"ZD":paramdict}]};
        [self zdaddwithparam:param];
        NSLog(@"%@",param);
    }
    else
    {
        self.currentTextField.text=nil;
        
        
        [MBProgressHUD showError:@"当前期数超出总期数，请重新填写"];
        
        return;
    }

 
}
- (void)zdaddwithparam:(NSDictionary *)param
{
    [self.mouthPayTextField resignFirstResponder];
    [self.totalTextField resignFirstResponder];
    [self.currentTextField resignFirstResponder];
    [self.firstTextField resignFirstResponder];
    [self.remark resignFirstResponder];
        NSURLRequest *request = [LiangTools getRequestWithMethod:@"ZDAdd" forParameter:param withManner:@"POST"];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
        
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *result = [LiangTools getWebServiceXMLResult:xml xpath:@"ZDAddResult"];
                NSString *status = result[@"text"];
                if([status isEqualToString:@"1"]){
                    [LiangTools showToastWithContent:@"账单上传失败"];
                    NSLog(@"账单上传失败");
                }else if([status isEqualToString:@"0"]){
                    NSLog(@"账单上传成功123");
                    [LiangTools showToastWithContent:@"账单上传成功"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self.navigationController popViewControllerAnimated:YES];
                    });
            

                    
                }else{
                
                }
            }else{
                NSLog(@"%@",error);
            }
        }];
        [task resume];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.mouthPayTextField resignFirstResponder];
    [self.totalTextField resignFirstResponder];
    [self.currentTextField resignFirstResponder];
    [self.firstTextField resignFirstResponder];
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
