//
//  yiwanTableViewController.m
//  SSB01
//
//  Created by momode on 16/6/22.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "yiwanTableViewController.h"
#import "XiaoDKCell.h"

@interface yiwanTableViewController ()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;




@end

@implementation yiwanTableViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"你我贷",@"拍拍贷",@"功夫贷图标",@"平安i贷图标",@"我来贷",@"叮当贷图标"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"你我贷",@"拍拍贷",@"功夫贷",@"平安i贷",@"我来贷",@"叮当贷"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"当天下款，件均13000元",@"下款速度通常为3小时",@"秒级审批放款，还款方便",@"无抵押、无材料、无需上门",@"放款最快的年轻人借贷平台",@"老牌‘国家队’网贷平台"];
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
        
        nwdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"nwdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }else if (indexPath.row == 1){
        
        ppdViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ppdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }else if (indexPath.row == 2){
        
        gfdViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"gfdViewController"];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 3){
        
        padViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"padViewController"];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 4){
        
        wldViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"wldViewController"];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 5){
        
        dddViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"dddViewController"];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
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
