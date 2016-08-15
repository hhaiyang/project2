//
//  MainViewController.m
//  SSB01
//
//  Created by 郑文青 on 16/6/2.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "MainViewController.h"
#import "SDCycleScrollView.h"
#import "oneViewController.h"

#import "Masonry.h"
#import "JRTJCell.h"
#import "JSDKCell.h"
#import "XiaoBTCell.h"
#import "sanqianTableViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "wuqianTableViewController.h"
#import "yiwanTableViewController.h"
#import "wuwanTableViewController.h"
#import "XYKTableViewController.h"
#import "XYKViewController.h"
#import "FQViewController.h"

#import "XEViewController.h"
#import "DEViewController.h"


static  NSMutableArray *httpUrls ;//全局变量

@interface MainViewController ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *HeaderView;
@property (weak,nonatomic) NSMutableArray *urlArray;

@end

@implementation MainViewController
-(NSArray *)urlArray
{
    if (!_urlArray) {
        _urlArray = [NSMutableArray array];
    }
    return _urlArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];

    self.tableView.backgroundColor = kRGBColor(240, 240, 240, 1.0);
    self.tableView.separatorStyle = NO;
//    [self jzsv];
    [self createButton];
    UIView *bt=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    bt.backgroundColor=[UIColor blackColor];
    [self.view addSubview:bt];
//
    //创蓝接口调用，直接浏览器打开http://we.liulongzhu.com/Service/WebServiceForApp.asmx，可以看到各个方法参数名字
    //        [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"ChuangLan" paramNames:@[@"strCellNumber",@"strType"] paramValues:@[@"13046370000",@"0"] success:^(NSData * data) {
    //
    //        }];
    //
    [self.HeaderView setBounds:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3.9*3.15+self.view.frame.size.height/40)];
    
////    导航接口调用
    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"Daohang" paramNames:nil paramValues:nil success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"%@",dic);
        NSData *jsonData = [dic[@"soap:Body"][@"DaohangResponse"][@"DaohangResult"] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resutData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];//转换数据格式
        NSLog(@"RESPONSE　DATA: %@", resutData);
        NSMutableArray * imageUrls = [NSMutableArray array];
        for (NSDictionary * dict in resutData[@"Daohang"]) {
            [imageUrls addObject:[NSString stringWithFormat:@"http://we.liulongzhu.com%@",dict[@"advpath"]]];
        }
        NSLog(@"imageurls:%@",imageUrls);
     
        httpUrls = [NSMutableArray array];
        
            for (NSDictionary *dict in resutData[@"Daohang"]) {
                
                [httpUrls addObject:[NSString stringWithFormat:@"%@",dict[@"link"]]];
                
            }
            
        
            NSLog(@"httpUrls:%@",httpUrls);
       
        
        [self jzsvWithUrls:imageUrls];
    }failure:^(NSError *error) {
        
    }];
////
//////
////
//

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jzsvWithUrls:(NSMutableArray*)imageUrls
{
    CGFloat w = self.view.bounds.size.width;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, self.view.frame.size.height/3.9) imageURLStringsGroup:imageUrls];
    cycleScrollView.delegate = self;
    
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [self.HeaderView addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.autoScrollTimeInterval = 1.0;
    
}


//测试  等待改链接
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"url数组:%@",httpUrls[index]);
    NSLog(@"点中了第%ld个",index);
    oneViewController *l1= [[oneViewController alloc]initWithWebURLStr:httpUrls[index]];
//    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
//    backItem.title=@"";
//    backItem.image=[UIImage imageNamed:@""];
//    self.navigationItem.backBarButtonItem=backItem;
   [self.navigationController pushViewController:l1 animated:YES];

};


-(void)createButton
{
    
    //创建一个view 放到scrollView上 才能滚动
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/3.9, self.view.bounds.size.width, self.view.frame.size.height/3.9*2.15+self.view.frame.size.height/40)];
    view.backgroundColor = [UIColor whiteColor];
    [self.HeaderView addSubview:view];
    
    //创建 4个按钮 放到view上
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button2];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button3];
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button4];
    //设置button 的图片 和点击事件
    [button1 setBackgroundImage:[UIImage imageNamed:@"big-icon_03"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    //给button添加约束
    CGFloat horGap = self.view.frame.size.width/14;
    CGFloat verGap = self.view.frame.size.height/34;
    CGFloat buttonWidth = self.view.frame.size.width/14*5;
    CGFloat buttonHeight = buttonWidth * 1.212195;
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边距
        make.left.mas_equalTo(horGap);
        //距离上面的view
        make.top.mas_equalTo(view).mas_equalTo(verGap);
        //高度
        make.height.mas_equalTo(buttonHeight);
        
        //为了适配屏幕 和button2 的宽度相等
        make.width.mas_equalTo(buttonWidth);
        
    }];
    
    //设置button 的图片 和点击事件
    [button2 setBackgroundImage:[UIImage imageNamed:@"big-icon_05"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(clickButton2) forControlEvents:UIControlEventTouchUpInside];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-horGap);
        make.top.mas_equalTo(view).mas_equalTo(verGap);
        make.height.mas_equalTo(buttonHeight);
        make.width.mas_equalTo(buttonWidth);
    }];
    
    //设置button 的图片 和点击事件
    [button3 setBackgroundImage:[UIImage imageNamed:@"big-icon_09"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(clickButton3) forControlEvents:UIControlEventTouchUpInside];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(horGap);
        make.top.mas_equalTo(button1.mas_bottom).mas_equalTo(verGap);
        make.height.mas_equalTo(buttonHeight);
        make.width.mas_equalTo(buttonWidth);
    }];
    
    //设置button 的图片 和点击事件
    [button4 setBackgroundImage:[UIImage imageNamed:@"big-icon_10"] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(clickButton4) forControlEvents:UIControlEventTouchUpInside];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-horGap);
        make.top.mas_equalTo(button2.mas_bottom).mas_equalTo(verGap);
        make.width.mas_equalTo(buttonWidth);
        make.height.mas_equalTo(buttonHeight);
        
    }];
    
    
    
    
}
//点中button 的点击事件
-(void)clickButton1
{
//    self.hidesBottomBarWhenPushed=YES;
    XEViewController *xyk=[[XEViewController alloc]init];
    [self.navigationController pushViewController:xyk animated:YES];
//    self.tabBarController.tabBar.hidden=NO;
//    self.hidesBottomBarWhenPushed=NO;
    
}
-(void)clickButton2
{
//    self.hidesBottomBarWhenPushed=YES;
    DEViewController *xyk=[[DEViewController alloc]init];
    [self.navigationController pushViewController:xyk animated:YES];
//    self.tabBarController.tabBar.hidden=NO;
//    self.hidesBottomBarWhenPushed=NO;
}
-(void)clickButton3
{
    
    //    XYKTableViewController *xykvc=[self.storyboard instantiateViewControllerWithIdentifier:@"XYKTableViewController"];
    //    [self.navigationController pushViewController:xykvc animated:YES];
    //
    
//    self.hidesBottomBarWhenPushed=YES;
    XYKViewController *xyk=[[XYKViewController alloc]init];
    [self.navigationController pushViewController:xyk animated:YES];
//    self.tabBarController.tabBar.hidden=NO;
//    self.hidesBottomBarWhenPushed=NO;
    
}
-(void)clickButton4
{
    
    
//    self.hidesBottomBarWhenPushed=YES;
    FQViewController *xyk=[[FQViewController alloc]init];
    [self.navigationController pushViewController:xyk animated:YES];
//    self.tabBarController.tabBar.hidden=NO;
//    self.hidesBottomBarWhenPushed=NO;
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        XiaoBTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaoBTCell" forIndexPath:indexPath];
        cell.iamgeView.image = [UIImage imageNamed:@"jiangbei"];
        cell.biaotiLb.text = @"今日推荐";
        cell.biaotiLb.textColor = kRGBColor(211, 29, 45, 1.0);
        return cell;
    }else if (indexPath.section == 1){
        JRTJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JRTJCell" forIndexPath:indexPath];
        cell.TJImageView.image = [UIImage imageNamed:@"11"];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"申请人数 662831人"];
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 7)];
        cell.peopleLb.attributedText = AttributedStr;
        
        cell.titleLb.text = @"信用钱包";
        cell.descLb.text = @"3个工作日下款 审批难度 5%";

        return cell;
    }
    else if (indexPath.section == 2){
        JRTJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JRTJCell" forIndexPath:indexPath];
        cell.TJImageView.image = [UIImage imageNamed:@"44"];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"申请人数 403121人"];
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 7)];
        cell.peopleLb.attributedText = AttributedStr;
        
        cell.titleLb.text = @"手机贷";
        cell.descLb.text = @"24小时之内下款 审批难度 9%";

        return cell;
    }else if (indexPath.section == 3){
        JRTJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JRTJCell" forIndexPath:indexPath];
        cell.TJImageView.image = [UIImage imageNamed:@"33"];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"申请人数 212121人"];
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 7)];
        cell.peopleLb.attributedText = AttributedStr;
        cell.titleLb.text = @"闪银";
        cell.descLb.text = @"24小时下款 审批难度 8%";
        return cell;
    }
    else if (indexPath.section == 4){
        XiaoBTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaoBTCell" forIndexPath:indexPath];
        cell.biaotiLb.text = @"急速贷款";
        cell.biaotiLb.textColor = kRGBColor(32, 71, 189, 1.0);
        cell.iamgeView.image = [UIImage imageNamed:@"feiji-1"];
        return cell;
    }else if(indexPath.section == 5){
        JSDKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSDKCell" forIndexPath:indexPath];
        NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc]initWithString:@"我要借3000"];
        [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 4)];
//        [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(3, 4)];
//        [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 3)];
        cell.titleLb.attributedText = titleText;
//        cell.titleLb.font=[UIFont systemFontOfSize:18];
        [cell.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/27);
            make.top.mas_equalTo(self.view.size.width/30);

        }];

        
        
        
        NSMutableAttributedString *descText = [[NSMutableAttributedString alloc]initWithString:@"500为本栏平台可借贷最低额度"];
        [descText addAttribute:NSForegroundColorAttributeName value:kRGBColor(144, 144, 144, 1.0) range:NSMakeRange(3, 12)];
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/35);

        }];

        cell.descLb.attributedText = descText;
        cell.iv1.image = [UIImage imageNamed:@"44"];
        cell.iv3.image = [UIImage imageNamed:@"11"];
        cell.iv2.image = [UIImage imageNamed:@"22"];

        
        
        return cell;
    }else if(indexPath.section == 6){
        JSDKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSDKCell" forIndexPath:indexPath];
        NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc]initWithString:@"我要借5000"];
        [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 4)];
        cell.titleLb.attributedText = titleText;
        
        NSMutableAttributedString *descText = [[NSMutableAttributedString alloc]initWithString:@"8000为本栏平台可借贷最高额度"];
        [descText addAttribute:NSForegroundColorAttributeName value:kRGBColor(144, 144, 144, 1.0) range:NSMakeRange(4, 12)];
        cell.descLb.attributedText = descText;
        [cell.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/27);
            make.top.mas_equalTo(self.view.size.width/30);
            
        }];
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/35);
            
        }];
        cell.iv1.image = [UIImage imageNamed:@"闪电借款"];
        cell.iv3.image = [UIImage imageNamed:@"88"];
        cell.iv2.image = [UIImage imageNamed:@"马上金融"];
        return cell;
    }else if(indexPath.section == 7){
        JSDKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSDKCell" forIndexPath:indexPath];
        NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc]initWithString:@"我要借10000"];
        [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 5)];
        cell.titleLb.attributedText = titleText;
        
        NSMutableAttributedString *descText = [[NSMutableAttributedString alloc]initWithString:@"20000为本栏平台可借贷最高额度"];
        [descText addAttribute:NSForegroundColorAttributeName value:kRGBColor(144, 144, 144, 1.0) range:NSMakeRange(5, 12)];
        cell.descLb.attributedText = descText;
        [cell.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/27);
            make.top.mas_equalTo(self.view.size.width/30);
            
        }];
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/35);
            
        }];
        cell.iv1.image = [UIImage imageNamed:@"功夫贷图标"];
        cell.iv3.image = [UIImage imageNamed:@"叮当贷图标"];
        cell.iv2.image = [UIImage imageNamed:@"我来贷"];
        return cell;
    }else if(indexPath.section == 8){
        JSDKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSDKCell" forIndexPath:indexPath];
        NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc]initWithString:@"我要借50000"];
        [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 5)];
        cell.titleLb.attributedText = titleText;
        
        
        NSMutableAttributedString *descText = [[NSMutableAttributedString alloc]initWithString:@"50万为本栏平台可借贷最高额度"];
        
        [descText addAttribute:NSForegroundColorAttributeName value:kRGBColor(144, 144, 144, 1.0) range:NSMakeRange(3, 12)];
        cell.descLb.attributedText = descText;
        [cell.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/27);
            make.top.mas_equalTo(self.view.size.width/30);
            
        }];
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.view.size.width/35);
            
        }];
        cell.iv1.image = [UIImage imageNamed:@"氧气贷_03"];
        cell.iv3.image = [UIImage imageNamed:@"好贷"];
        cell.iv2.image = [UIImage imageNamed:@"宅e贷图标"];
        return cell;
    }else if (indexPath.section == 9){
        XiaoBTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaoBTCell" forIndexPath:indexPath];
        cell.iamgeView.image = [UIImage imageNamed:@"信用卡还款_03"];
        cell.biaotiLb.text = @"信用卡还款";
        cell.biaotiLb.textColor = kRGBColor(211, 29, 45, 1.0);
        return cell;
    }else if (indexPath.section == 10){
        JRTJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JRTJCell" forIndexPath:indexPath];
        cell.TJImageView.image = [UIImage imageNamed:@"小赢卡贷图标"];
        
        [cell.TJImageView setBounds:CGRectMake(9, 9, 42, 42)];
        
        
        NSMutableAttributedString *AttributedStr =nil;
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 7)];
        cell.peopleLb.attributedText = AttributedStr;
        cell.titleLb.text = @"小赢卡贷";
        cell.descLb.text = @"代信用卡快速还款,当天到账";
        cell.descLb.font = [UIFont fontWithName:[[UIFont familyNames] objectAtIndex:7] size:11];
        cell.descLb.textColor = kRGBColor(100, 100, 100, 1.0);
    
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(cell.titleLb).mas_equalTo(cell.contentView.frame.size.height/2.2);
            
            
        }];
        
        
        return cell;
    }else if (indexPath.section == 11){
       
        JRTJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JRTJCell" forIndexPath:indexPath];
        cell.TJImageView.image = [UIImage imageNamed:@"省呗图标"];
        NSMutableAttributedString *AttributedStr =nil;
        
        [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 7)];
        cell.peopleLb.attributedText = AttributedStr;
        [cell.TJImageView setBounds:CGRectMake(9, 9, 42, 42)];

        cell.titleLb.text = @"省呗";
        cell.descLb.text = @"帮你代还信用卡,低息、方便";
        cell.descLb.font = [UIFont fontWithName:[[UIFont familyNames] objectAtIndex:7] size:11];
        cell.descLb.textColor = kRGBColor(100, 100, 100, 1.0);
     
        [cell.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(cell.titleLb).mas_equalTo(cell.contentView.frame.size.height/2.2);
            
            
        }];
        
        
        
        
        return cell;
    }else {
        return nil;
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        xyqbViewController *xyvc = [self.storyboard instantiateViewControllerWithIdentifier:@"xyqbViewController"];
        xyvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:xyvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
    }
    if (indexPath.section==2) {
        sjdViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"sjdViewController"];
        svc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:svc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }if (indexPath.section==3) {
        syViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }if (indexPath.section==5) {
        NSLog(@"123");
        sanqianTableViewController *jVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sanqianTableViewController"];
        [self.navigationController pushViewController:jVC animated:YES];
        
        
        
    }if (indexPath.section==6) {
        wuqianTableViewController *jVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wuqianTableViewController"];
        [self.navigationController pushViewController:jVC animated:YES];

        
        
        
        
    }if (indexPath.section==7) {
        yiwanTableViewController *jVC = [self.storyboard instantiateViewControllerWithIdentifier:@"yiwanTableViewController"];
        [self.navigationController pushViewController:jVC animated:YES];
    
    
    }if (indexPath.section==8) {
        wuwanTableViewController *jVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wuwanTableViewController"];
        [self.navigationController pushViewController:jVC animated:YES];
        
        
        
    }if (indexPath.section==10) {
        xykdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"xykdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;

        
        
        
        
    }if (indexPath.section==11) {
      
        
        sbViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"sbViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }







    
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 25;
    }else if (indexPath.section == 4){
        return 25;
    }else if (indexPath.section == 9){
        return 25;
    }else{
        return 60;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 12) {
        return 10;
    }
    return 5;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden=NO;
    self.parentViewController.tabBarController.tabBar.hidden =NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
//    self.parentViewController.tabBarController.tabBar.hidden = YES;
}






@end
