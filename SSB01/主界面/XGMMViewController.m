//
//  XGMMViewController.m
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XGMMViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "DLZCViewController.h"
#import "LiangTools.h"



@interface XGMMViewController ()


@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdnew;

@property (weak, nonatomic) IBOutlet UITextField *pwdnewtwo;
@property (nonatomic,strong)NSDictionary * userInfoDic;


@property (weak, nonatomic) IBOutlet UIButton *xgmm;
@end

@implementation XGMMViewController

-(instancetype)initWithlaomima:(NSString *)laomima
{
    self=[self init];
    if (self) {
        _laomima=laomima;
    }
    return self;
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
    self.title=@"修改密码";
    
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    _pwdTextField.text=_laomima;
    UILabel *ui=[[UILabel alloc]init];
    ui.text=_laomima;
    
}



- (void)modifyPasswordWithUid:(NSString *)uid oldPwd:(NSString *)oldPwd newPwd:(NSString *)newPwd
{

    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"PassWordUpdate"
                      paramNames:@[@"Uid",@"strOldPassWord",@"strNewPassWord"]
                     paramValues:[NSArray arrayWithObjects:[NSNumber numberWithInt:[uid intValue]],oldPwd,newPwd, nil] success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSString * result = dic[@"soap:Body"][@"PassWordUpdateResponse"][@"PassWordUpdateResult"];
        if([result isEqualToString:@"1"]){
            //修改失败
            [LiangTools showToastWithContent:@"修改失败"];
        }else if([result isEqualToString:@"0"]){
            //修改成功
            [LiangTools showToastWithContent:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            //未返回数据
        }
    }failure:^(NSError *error) {
        [LiangTools showToastWithContent:@"请求失败"];
    }];
}
- (IBAction)XGMMbtn:(UIButton *)sender {
    
//
    
    
    
    _userInfoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfoDic"];
  
    NSString *uid = [_userInfoDic objectForKey:@"Geren"][@"uid"];
    if(uid.length == 0 || [uid isEqualToString:@""] || uid == nil){
        //uid有误
        return;
    }
    NSLog(@"%@",uid);
    if (self.pwdTextField.text.length == 0 || self.pwdnew.text.length == 0 || self.pwdnewtwo.text.length == 0 || ![self.pwdnew.text isEqualToString:self.pwdnewtwo.text] ) {
        //密码有误
        return;
    }
    [self modifyPasswordWithUid:uid oldPwd:self.pwdTextField.text newPwd:self.pwdnew.text];
//    if([LiangTools checkPassword:self.pwdTextField.text] && [LiangTools checkPassword:self.pwdnew.text]){
//        [self modifyPasswordWithUid:uid oldPwd:self.pwdTextField.text newPwd:self.pwdnew.text];
//        //            [self.navigationController popViewControllerAnimated:YES];
//        NSLog(@"修改密码成功");
//    }
    

    
    
   
   
    



    //        [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"ChuangLan" paramNames:@[@"strCellNumber",@"strType"] paramValues:@[@"13046370000",@"0"] success:^(NSData * data) {
    //
    //        }];
    //
    
    /**
     *  请求数据
     *
     *  @param url          请求url
     *  @param functionName 方法名
     *  @param paramNames   参数名数组
     *  @param paramValues  参数值数组
     *  @param success      请求成功返回值
     */
    
    ////    导航接口调用
//    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"PassWordUpdate" paramNames:@[@"Uid",@"strOldPassWord",@"strNewPassWord"] paramValues:[NSArray arrayWithObjects:_username.text,_password.text, nil] success:^(NSData * data) {
//        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
//        NSLog(@"%@",dic);
//        NSData *jsonData = [dic[@"soap:Body"][@"DaohangResponse"][@"DaohangResult"] dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *resutData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];//转换数据格式
//        NSLog(@"RESPONSE　DATA: %@", resutData);
//        NSMutableArray * imageUrls = [NSMutableArray array];
//        for (NSDictionary * dict in resutData[@"Daohang"]) {
//            [imageUrls addObject:[NSString stringWithFormat:@"http://we.liulongzhu.com%@",dict[@"advpath"]]];
//        }
//        NSLog(@"imageurls:%@",imageUrls);
//        
//        httpUrls = [NSMutableArray array];
//        
//        for (NSDictionary *dict in resutData[@"Daohang"]) {
//            
//            [httpUrls addObject:[NSString stringWithFormat:@"%@",dict[@"link"]]];
//            
//        }
//        
//        
//        NSLog(@"httpUrls:%@",httpUrls);
//        
//        
//        [self jzsvWithUrls:imageUrls];
//    }];
//
//    
    


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
