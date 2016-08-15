//
//  FQTableViewController.m
//  SSB01
//
//  Created by momode on 16/7/15.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "FQTableViewController.h"


#import "XYKTableViewCell.h"



@interface FQTableViewController ()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;
@end

@implementation FQTableViewController

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"你我贷",@"叮当贷图标",@"豆豆钱图标",@"55",@"功夫贷图标",@"马上金融",@"小花钱包图标"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"你我贷",@"叮当贷",@"豆豆钱",@"拍拍贷",@"功夫贷",@"马上消费",@"小花钱包"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"当天下款，件均13000元",@"老牌‘国家队’网贷平台",@"申请审核简便，7天内免息",@"下款速度通常为3小时",@"秒级审批放款，还款方便",@"利息低，风控严格",@"轻松提现，随借随还"];
    }
    return _subTitleArray;
}


- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden=YES;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    XYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[XYKTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        
    }
   
        cell.chanpinimage.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        cell.biaoti.text = self.titleArray[indexPath.row];
        cell.neirong.text = self.subTitleArray[indexPath.row];
   
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        nwdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"nwdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 1){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        dddViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"dddViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
    }else if (indexPath.row == 2){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ddqViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"ddqViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
       
        
    }else if (indexPath.row == 3){
        
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ppdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"ppdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
       
    }else if (indexPath.row == 4){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        gfdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"gfdViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
    }else if (indexPath.row == 5){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        msjrViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"msjrViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
        
    }else if (indexPath.row == 6){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        xhqbViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"xhqbViewController"];
        fvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:fvc animated:YES];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
        backItem.title=@"";
        backItem.image=[UIImage imageNamed:@""];
        self.navigationItem.backBarButtonItem=backItem;
        
        
        
    }
    

    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.1;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}



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
