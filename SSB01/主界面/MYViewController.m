//
//  MYViewController.m
//  SSB01
//
//  Created by momode on 16/6/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "MYViewController.h"
#import "DLZCViewController.h"
#import "QYQKViewController.h"
#import "XYCSViewController.h"
#import "BZViewController.h"
#import "TXViewController.h"
#import "XYQKTableViewController.h"
#import "WNJDSViewController.h"


@interface MYViewController ()

@property (weak, nonatomic) IBOutlet UIView *TView;
@property (nonatomic,strong)NSDictionary * userInfoDic;


@property (weak, nonatomic) IBOutlet UIView *beijing;


@property (weak, nonatomic) IBOutlet UIButton *DLZCBtn;

@end

@implementation MYViewController



//-(void)changgeDLZCTitle:(NSString *)title
//{
//    if (title!=nil && title.length>0) {
//        [self.DLZCBtn setTitle:title forState:UIControlStateNormal];
//        
//    }
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    UIView *bt=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    bt.backgroundColor=[UIColor blackColor];
    [self.view addSubview:bt];
    _TView.backgroundColor=[UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:1];
    
    _touxiang.userInteractionEnabled = YES;
    _touxiang.layer.cornerRadius = 35;
    _touxiang.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage:)];
    [_touxiang addGestureRecognizer:singleTap];
   
    NSLog(@"%@",_name);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onClickImage:(UIImage *)image
{
    _userInfoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfoDic"];
    if (!_userInfoDic) {
        NSLog(@"用户没有登陆,上面显示登陆注册按钮");
        
        
    }else{
        NSLog(@"用户已经登陆，上面显示用户头像等信息");

    NSLog(@"touxiang");
        TXViewController *tx=[self.storyboard instantiateViewControllerWithIdentifier:@"TXViewController"];
        _beijing.backgroundColor=[UIColor blueColor];
        [self.navigationController pushViewController:tx animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
    __weak typeof(self)weakSelf = self;
    tx.imageBlock = ^(UIImage *image)
    {
        weakSelf.touxiang.image = image;
    };
    
    
    
    self.navigationItem.backBarButtonItem=backItem;
    
    tx.firstValue=self.DLZCBtn.titleLabel.text;
    }
    
}
//- (IBAction)TXbtn:(UIButton *)sender {
//    NSLog(@"touxiang");
//    TXViewController *tx=[self.storyboard instantiateViewControllerWithIdentifier:@"TXViewController"];
//    [self.navigationController pushViewController:tx animated:YES];
//    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
//    backItem.title=@"";
//    backItem.image=[UIImage imageNamed:@""];
//    self.navigationItem.backBarButtonItem=backItem;
//
//    
//    
//}

- (IBAction)DLZCbtn:(UIButton *)sender {
    DLZCViewController *lVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DLZCViewController"];
    lVC.block=^(NSString *name){
        if (name!=nil && name.length>0){
            [self.DLZCBtn setTitle:name forState:UIControlStateNormal];
            [self.DLZCBtn setBackgroundImage:nil forState:UIControlStateNormal];
        }
    };
    [self.navigationController pushViewController:lVC animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;


}




- (IBAction)QYQKbtn:(UIButton *)sender {
    NSLog(@"xinyongqingkuang");
    XYQKTableViewController *xyqktbc=[self.storyboard instantiateViewControllerWithIdentifier:@"XYQKTableViewController"];
    [self.navigationController pushViewController:xyqktbc animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    
}


- (IBAction)XYCSbtn:(UIButton *)sender {
    NSLog(@"信用测试");
    WNJDSViewController *bVC=[self.storyboard instantiateViewControllerWithIdentifier:@"WNJDSViewController"];
    [bVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:bVC animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
}

- (IBAction)BZbtn:(UIButton *)sender {
    NSLog(@"帮助");
    
    BZViewController *bVC=[self.storyboard instantiateViewControllerWithIdentifier:@"BZViewController"];
    [self.navigationController pushViewController:bVC animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    
}
- (void)viewWillAppear:(BOOL)animated {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
        [super viewWillAppear:animated];
        _userInfoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfoDic"];
        if (!_userInfoDic) {
            NSLog(@"用户没有登陆,上面显示登陆注册按钮");
            [_DLZCBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
            _DLZCBtn.userInteractionEnabled = YES;
            [self.touxiang setImage:[UIImage imageNamed:@"头像_03"]];
            _beijing.backgroundColor=[UIColor grayColor];
            [_DLZCBtn setBackgroundImage:[UIImage imageNamed:@"denglu"] forState:UIControlStateNormal];


        }else{
            _beijing.backgroundColor=[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:1.0];

            NSLog(@"用户已经登陆，上面显示用户头像等信息");
            NSLog(@"1111111111%@",_userInfoDic);
            [_DLZCBtn setTitle:USERINFO[@"username"] forState:UIControlStateNormal];
            _DLZCBtn.userInteractionEnabled = NO;
            [_DLZCBtn setBackgroundImage:nil forState:UIControlStateNormal];
            NSString *str=USERINFO[@"headimg"];
            NSString *yuanurl=@"http://we.liulongzhu.com";
            NSURL *tupianurl=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",yuanurl,str]];
            [self.touxiang sd_setImageWithURL:tupianurl placeholderImage:[UIImage imageNamed:@"头像_03"]];
        
        }
        NSLog(@"1111111111%@",_userInfoDic);
    
    self.parentViewController.tabBarController.tabBar.hidden =NO;
    
    }
    
    


- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];

   

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
