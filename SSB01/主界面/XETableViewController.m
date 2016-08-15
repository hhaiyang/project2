//
//  XETableViewController.m
//  SSB01
//
//  Created by momode on 16/7/16.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XETableViewController.h"
#import "XYKTableViewCell.h"
@interface XETableViewController ()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *subTitleArray;

@property (nonatomic,strong)NSArray *imageArray1;
@property (nonatomic,strong)NSArray *titleArray1;
@property (nonatomic,strong)NSArray *subTitleArray1;
@property (nonatomic, retain) UIView *tableFooterView;

@end

@implementation XETableViewController
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@"33",@"44",@"11",@"22",@"闪电借款",@"发薪",@"我来贷",@"贷款王"];
    }
    return _imageArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"闪银",@"手机贷",@"信用钱包",@"现金巴士",@"闪电贷款",@"发薪贷",@"我来贷",@"贷款王"];
    }
    return _titleArray;
}
-(NSArray *)subTitleArray
{
    if (!_subTitleArray) {
        _subTitleArray = @[@"一次申请，九次授信",@"适合经常在网上消费的人群",@"申请材料少，下款速度快",@"小额短期，无限循环",@"需要用卡申请,速度较快",@"申请只需一张身份证",@"放款最快的年轻人借款平台",@"适合收入稳定的非学生群体"];
    }
    return _subTitleArray;
}


-(NSArray *)imageArray1
{
    if (!_imageArray1) {
        _imageArray1 = @[@"名校贷图标1",@"u族图标",@"信通贷"];
    }
    return _imageArray1;
}
-(NSArray *)titleArray1
{
    if (!_titleArray1) {
        _titleArray1 = @[@"名校贷",@"U族",@"信通贷"];
    }
    return _titleArray1;
}
-(NSArray *)subTitleArray1
{
    if (!_subTitleArray1) {
        _subTitleArray1 = @[@"备受大学生青睐的借款平台",@"专属大学生的金融生活社区",@"专注于大学生分期服务的平台"];
    }
    return _subTitleArray1;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            syViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"syViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;
            
            
        }if (indexPath.row==1) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            sjdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"sjdViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==2) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            xyqbViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"xyqbViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==3) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            xjbsViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"xjbsViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==4) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            sddkViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"sddkViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==5) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            fxdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"fxdViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==6) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            wldViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"wldViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==7) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            dkwViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"dkwViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }


    }


        
        
    if (indexPath.section == 1) {
        
        if (indexPath.row==0) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            mxdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"mxdViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==1) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            uzViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"uzViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }if (indexPath.row==2) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            xtdViewController *fvc = [sb instantiateViewControllerWithIdentifier:@"xtdViewController"];
            fvc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fvc animated:YES];
            UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
            backItem.title=@"";
            backItem.image=[UIImage imageNamed:@""];
            self.navigationItem.backBarButtonItem=backItem;

        }
        
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
        tu.image=[UIImage imageNamed:@"学生贷_03"];
        [view addSubview:label];
        [view addSubview:tu];
        tu.sd_layout.leftSpaceToView(view,20).topSpaceToView(view,5).bottomSpaceToView(view,5).widthIs(20);
        label.sd_layout.leftSpaceToView(tu,10).topSpaceToView(view,7).bottomSpaceToView(view,7).widthIs(100);
        label.text=@"学生贷";
        label.numberOfLines=0;
        label.textColor=kRGBColor(36, 100, 231, 1.0);
        return view;
        
        
        
    }
    
    return nil;
    
}
//-(void)geshi:(UIViewController *)weizhi;
//{
//    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
//    backItem.title=@"";
//    backItem.image=[UIImage imageNamed:@""];
//    self.navigationItem.backBarButtonItem=backItem;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
