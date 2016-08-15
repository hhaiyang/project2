//
//  XYKTableViewController.m
//  SSB01
//
//  Created by momode on 16/7/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XYKTableViewController.h"
#import "XiaoDKCell.h"

#import "XYKTableViewCell.h"


@interface XYKTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;

@property (nonatomic,strong)NSArray *imageArray1;
@property (nonatomic,strong)NSArray *titleArray1;
@property (nonatomic,strong)NSArray *subTitleArray1;
@property (nonatomic, retain) UIView *tableFooterView;
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation XYKTableViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"好贷",@"交通银行"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"好贷信用卡",@"交通银行"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"在线申请9家银行信用卡",@"在线申请信用卡"];
    }
    return _subTitleArray;
}


-(NSArray *)imageArray1
{
    if (!_imageArray1) {
        _imageArray1 = @[@"小赢卡贷图标",@"省呗图标"];
    }
    return _imageArray1;
}
-(NSArray *)titleArray1
{
    if (!_titleArray1) {
        _titleArray1 = @[@"小赢卡贷",@"省呗"];
    }
    return _titleArray1;
}
-(NSArray *)subTitleArray1
{
    if (!_subTitleArray1) {
        _subTitleArray1 = @[@"用于信用卡快速还款",@"分期还款，信用越好折扣越大"];
    }
    return _subTitleArray1;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    //    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, super.view.frame.size.height-100, self.view.frame.size.width, 50)];
//    view.backgroundColor=[UIColor whiteColor];
//    UIButton *button =[[UIButton alloc]init];
//    
//    
//    
//    view.layer.borderWidth = 1;
//    view.layer.borderColor = [kRGBColor(214, 215, 220, 1.0) CGColor];
//    
//    [button setImage:[UIImage imageNamed:@"没找到合适"] forState:UIControlStateNormal];
//    [view addSubview:button];
//    
//    button.sd_layout.leftSpaceToView(view,30).topSpaceToView(view,10).rightSpaceToView(view,30).heightIs(30);
//    
//    //6.设置触发事件
//    [button addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    
   
    
    
    self.tabBarController.tabBar.hidden=YES;
}
//-(void)addFooterButton
//{
//    //1.初始化Button
//    UIButton *button =[[UIButton alloc]init];
//    [button setSize:CGSizeMake(280, 40)];
//    [button setFrame:CGRectMake(0, 20, 280, 40)];
//    //2.设置文字和文字颜色
////    [button setTitle:@"还没找到合适的产品？来这里看看" forState:UIControlStateNormal];
////    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//////
////    //3.设置圆角幅度
////    button.layer.cornerRadius = 10.0;
////    button.layer.borderWidth = 1.0;
////  
//////    //4.设置frame
//////    button.frame = CGRectMake(0, 50, 50, 44);
////    
////    //5.设置背景色
////    button.backgroundColor =[UIColor blueColor];
////
//    [button setImage:[UIImage imageNamed:@"没有找到合适"] forState:UIControlStateNormal];
//    
//    //6.设置触发事件
//    [button addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    //7.添加到tableView tableFooterView中
//    self.tableView.tableFooterView = button;
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==1) {
        return self.imageArray1.count;
    }if (section==0) {
        return self.imageArray.count;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    XYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XYKTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        
           }
    if (indexPath.section==1) {
        cell.chanpinimage.image = [UIImage imageNamed:self.imageArray1[indexPath.row]];
        cell.biaoti.text = self.titleArray1[indexPath.row];
        cell.neirong.text = self.subTitleArray1[indexPath.row];
        
         return cell;
    }if (indexPath.section==0) {
        cell.chanpinimage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        cell.biaoti.text = self.titleArray[indexPath.row];
        cell.neirong.text = self.subTitleArray[indexPath.row];
    }
   
    
    return cell;
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            UIViewController *hd=[[UIViewController alloc]init];
            _webView = [[UIWebView alloc] initWithFrame:hd.view.bounds];
            NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://creditcard.liulongzhu.com/"]];
             hd.hidesBottomBarWhenPushed=YES;
            [hd.view addSubview: _webView];
            [_webView loadRequest:request];
[self.navigationController pushViewController:hd animated:YES];
            
//            self.hidesBottomBarWhenPushed=YES;
//           
//            self.tabBarController.tabBar.hidden=NO;
//            self.hidesBottomBarWhenPushed=NO;
            
//            http://8.yun.haodai.com/?ref=hd_11011666
            
        }if (indexPath.row==1) {
            UIViewController *hd=[[UIViewController alloc]init];
            _webView = [[UIWebView alloc] initWithFrame:hd.view.bounds];
            NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.omsys.com.cn/jiaohangwl/index.php?aid=amlhb2hhbmd3bF80NTY5Xzk5X3llcw=="]];
            [hd.view addSubview: _webView];
            [_webView loadRequest:request];
            hd.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:hd animated:YES];
            
             hd.hidesBottomBarWhenPushed=YES;
        }
        
        
    }if (indexPath.section == 1) {
        
        if (indexPath.row==0) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        xykdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"xykdViewController"];
                        fvc.hidesBottomBarWhenPushed = YES;
                        [self.navigationController pushViewController:fvc animated:YES];
                        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
                        backItem.title=@"";
                        backItem.image=[UIImage imageNamed:@""];
                        self.navigationItem.backBarButtonItem=backItem;
        }if (indexPath.row==1) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            sbViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"sbViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;        }
    }
   
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1){
        return 30;
    }
    return 10;
}
//wwww
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
//    if (section==1) {
//        return 50;
//    }
//    
    
    return 0.1;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
//section上的控件

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
//    if (section==1) {
//        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//        view.backgroundColor=[UIColor whiteColor];
//        UIButton *button =[[UIButton alloc]init];
//        
//        
//        
//        view.layer.borderWidth = 1;
//        view.layer.borderColor = [kRGBColor(214, 215, 220, 1.0) CGColor];
//        
//        [button setImage:[UIImage imageNamed:@"没找到合适"] forState:UIControlStateNormal];
//        [view addSubview:button];
//        
//    button.sd_layout.leftSpaceToView(view,30).topSpaceToView(view,10).rightSpaceToView(view,30).heightIs(30);
//        
//        //6.设置触发事件
//        [button addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
//        
//        return view;
//        
//        
//        
//    }
    
    return nil;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (section==1) {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
        view.backgroundColor=kRGBColor(220, 220, 220, 1.0);
        UILabel * label=[UILabel new];
        label.font=[UIFont systemFontOfSize:13];
        UIImageView *tu=[UIImageView new];
        tu.image=[UIImage imageNamed:@"xinyongkaxiaotu"];
        [view addSubview:label];
        [view addSubview:tu];
        tu.sd_layout.leftSpaceToView(view,20).topSpaceToView(view,5).bottomSpaceToView(view,5).widthIs(20);
        label.sd_layout.leftSpaceToView(tu,10).topSpaceToView(view,7).bottomSpaceToView(view,7).widthIs(100);
        label.text=@"信用卡还款";
        label.numberOfLines=0;
        label.textColor=kRGBColor(36, 100, 231, 1.0);
         return view;
        
        
        
    }
    
    return nil;
    
}

//-(void)viewDidLayoutSubviews{
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
//    {
//        [self.tableView setSeparatorInset:UIEdgeInsetsMake(20,20,20,20)];
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
//    {
//        [self.tableView setLayoutMargins:UIEdgeInsetsMake(20,20,20,20)];
//    }
//}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
//    {
//        [cell setSeparatorInset:UIEdgeInsetsMake(20,20,20,20)];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
//    {
//        [cell setLayoutMargins:UIEdgeInsetsMake(20,20,20,20)];
//    }
//}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
