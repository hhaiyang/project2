//
//  wuqianTableViewController.m
//  SSB01
//
//  Created by momode on 16/6/22.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "wuqianTableViewController.h"
#import "XiaoDKCell.h"
@interface wuqianTableViewController ()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;




@end

@implementation wuqianTableViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"闪电借款",@"贷款王",@"马上金融",@"豆豆钱图标"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"闪电借款",@"贷款王",@"马上消费",@"豆豆钱"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"需信用卡申请,速度较快",@"适合收入稳定的非学生人群",@"利息低,风控严格",@"申请审核简便，七天内免息"];
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
        sddkViewController *sdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"sddkViewController"];
        sdvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sdvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
        
        
    }else if (indexPath.row == 1){
        
        dkwViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"dkwViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }else if (indexPath.row == 2){
        
        msjrViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"msjrViewController"];
        mvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 3){
        
        ddqViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ddqViewController"];
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
