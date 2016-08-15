//
//  sanqianTableViewController.m
//  SSB01
//
//  Created by momode on 16/6/22.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "sanqianTableViewController.h"
#import "XiaoDKCell.h"
@interface sanqianTableViewController ()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;
@end

@implementation sanqianTableViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"44",@"11",@"闪银",@"发薪",@"22",@"名校贷图标1"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"手机贷",@"信用钱包",@"闪银",@"发薪贷",@"现金巴士",@"名校贷"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"适合经常在网上消费的人群",@"信用材料少,下款速度快",@"一次申请,九次授信",@"申请只需一张身份证",@"小额短期,无限循环",@"备受大学生青睐的借款平台"];
    }
    return _subTitleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden=YES;
self.tableView.tableFooterView = [[UIView alloc]init];
    
    UIView *bt=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 10)];
    bt.backgroundColor=kRGBColor(239, 239, 239, 1.0);
    [self.view addSubview:bt];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    self.title = @"急速贷款";
    
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    [self setHidesBottomBarWhenPushed:YES];
    self.tableView.sectionFooterHeight = 0;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    XiaoDKCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XiaoDKCell" forIndexPath:indexPath];
    
    
    cell.iconimageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.titleLb.text = self.titleArray[indexPath.row];
    cell.subTitleLb.text = self.subTitleArray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        sjdViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"sjdViewController"];
        svc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:svc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }else if (indexPath.row == 1){
        
        xyqbViewController *xyvc = [self.storyboard instantiateViewControllerWithIdentifier:@"xyqbViewController"];
        xyvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:xyvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 2){
        
        
        syViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 3){
        
        
        fxdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"fxdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 4){
        
        
        xjbsViewController *xvc = [self.storyboard instantiateViewControllerWithIdentifier:@"xjbsViewController"];
        xvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:xvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
      
        
    }else if (indexPath.row == 5){
        
        mxdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
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
    return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0;
}

-(void)viewDidLayoutSubviews{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(30,30,30,30)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(30,30,30,30)];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsMake(30,30,30,30)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsMake(30,30,30,30)];
    }
}






/* if (indexPath.row == 10){
 
 hdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"hdViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 11){
 
 ddqViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ddqViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 12){
 
 sbViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"sbViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 13){
 
 padViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"padViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 14){
 
 r360ViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"r360ViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 
 
 }else if (indexPath.row == 15){
 
 xykdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"xykdViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 16){
 
 gfdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"gfdViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 17){
 
 msjrViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"msjrViewController"];
 mvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:mvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 
 
 }else if (indexPath.row == 18){
 
 mxdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else if (indexPath.row == 19){
 
 dddViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"dddViewController"];
 fvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:fvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }else{
 
 
 uzViewController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"uzViewController"];
 rvc.hidesBottomBarWhenPushed = YES;
 [self.navigationController pushViewController:rvc animated:YES];
 UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
 backItem.title=@"";
 backItem.image=[UIImage imageNamed:@""];
 self.navigationItem.backBarButtonItem=backItem;
 
 }
 */

@end
