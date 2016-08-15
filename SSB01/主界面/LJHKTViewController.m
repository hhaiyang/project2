//
//  LJHKTViewController.m
//  SSB01
//
//  Created by momode on 16/7/11.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "LJHKTViewController.h"
#import "ZDViewController.h"
#import "ZDCell.h"
#import "ZDViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"

@interface LJHKTViewController ()
@property(nonatomic,retain) NSString *jsname ;
@property(nonatomic,retain) NSString *jsmoney ;
@property(nonatomic,retain) NSString *jstu ;
@end

@implementation LJHKTViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"moshaboli"]];
    UILabel *biaoti1=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/5*2, self.view.frame.size.height/5, 100, 30)];
    biaoti1.text=@"手动账单";
    biaoti1.textColor=[UIColor grayColor];
    biaoti1.numberOfLines=1;
    [self.view addSubview:biaoti1];

    UIImageView *ui=[[UIImageView alloc]initWithImage:[UIImage imageNamed:self.jstu]];
    [ui setFrame:CGRectMake(self.view.frame.size.width/5*2+5, self.view.frame.size.height/3.5, self.view.frame.size.width/6, self.view.frame.size.width/6)];
    [self.view addSubview:ui];
    UILabel *cpname=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/5*2+13, self.view.frame.size.height/3.5+self.view.frame.size.width/6+10, 100, 30)];
    cpname.text=self.jsname;
    cpname.center = CGPointMake(self.view.frame.size.width/2, cpname.center.y);
    cpname.textColor=[UIColor grayColor];
    cpname.textAlignment = NSTextAlignmentCenter;
    cpname.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:cpname];
    
    UILabel *cpmoney=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/5*2-15, self.view.frame.size.height/1.9, self.view.frame.size.width/3, 40)];
//    cpmoney.backgroundColor = [UIColor orangeColor];
    cpmoney.text=self.jsmoney;
    cpmoney.center = CGPointMake(self.view.frame.size.width/2, cpmoney.center.y);
    cpmoney.textColor=[UIColor blackColor];
    cpmoney.textAlignment = NSTextAlignmentCenter;
    cpmoney.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:cpmoney];
    UIButton *fhBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height/1.4, self.view.frame.size.width/6*4, 45)];
    UIImage *stretchableButtonImage=[UIImage imageNamed:@"biaojihuankuan"];
//    fhBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mybeijing2"]];
    [fhBtn setBackgroundImage:stretchableButtonImage  forState:UIControlStateNormal];
    [fhBtn addTarget:self action:@selector(clickBackItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fhBtn];
    
    
    
}
- (void)clickBackItem
{
//     [self.navigationController popViewControllerAnimated:YES];
    [self zdPayAction];
}
- (void)zdPayAction
{
    //    [NSNumber numberWithInt:[self.model.ZDUid intValue]]
    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"ZDPay" paramNames:@[@"uid"] paramValues:[NSArray arrayWithObjects:[NSNumber numberWithInt:[self.model.ZDUid intValue]],nil] success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"%@",dic);
        NSString * result = dic[@"soap:Body"][@"ZDPayResponse"][@"ZDPayResult"];
        if([result isEqualToString:@"1"]){
            NSLog(@"还款失败！");
            [LiangTools showToastWithContent:@"还款失败"];
        }else if([result isEqualToString:@"0"]){
            [LiangTools showToastWithContent:@"保存成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
            
            
//            
//            NSUInteger *qishu=[NSNumber new];
//            NSLog(@"qishu%d",_model.ZDPeriods);
            
            NSString *huankuanqi=[NSString stringWithFormat:@"本期已还，剩余%d期未还",[_model.ZDPeriods intValue]-[_model.ZDPeriodNow intValue]-1];
            [MBProgressHUD showError:huankuanqi];

            
            
        }else{
            NSLog(@"返回数据有误");
            
//            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求失败，请重新再试"];

        [LiangTools showToastWithContent:@"请求失败"];
    }];
    
    
}
- (void)setModel:(CPZDModel *)model
{
    _model = model;
    self.jsname=model.ZDProductName;
    self.jsmoney= [NSString stringWithFormat:@"%ld",[model.ZDAmountPer integerValue] * [model.ZDPeriods integerValue]];
    self.jstu=model.ZDProductImage;
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
