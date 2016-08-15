//
//  AddTableViewController.m
//  SSB01
//
//  Created by momode on 16/7/8.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "AddTableViewController.h"
//#import "ZDAddCell.h"
#import "JDPTCell.h"
#import "PTModel.h"
@interface AddTableViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic,retain)NSMutableArray *sectionTitlesArray; // 区头数组
@property (nonatomic,retain)NSDictionary *bigDic; // 读取本地plist文件的字典
@property (nonatomic,strong)NSMutableArray *dataArray;//数据源

@property (nonatomic,strong)NSMutableArray *ImageArray;


@end

@implementation AddTableViewController
-(void)loadImageData
{
    NSMutableArray *sectionTmpArray=[NSMutableArray array];
    self.ImageArray=[NSMutableArray array];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"AddTP.plist" ofType:nil
                    ];
    NSDictionary *imageDict=[[NSDictionary alloc]initWithContentsOfFile:path];
    NSArray *allKeys=[imageDict allKeys];
    [sectionTmpArray addObjectsFromArray:[allKeys sortedArrayUsingSelector:@selector(compare:)]];
    [sectionTmpArray enumerateObjectsUsingBlock:^(NSString *zimu, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *imageArr = imageDict[zimu];
        [self.ImageArray addObject:imageArr];
    }];
    
    
    
    
}







-(void)loadData
{

    self.sectionTitlesArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"JDPT"
                                                   ofType:@"plist"];
    self.bigDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray * allKeys = [self.bigDic allKeys];
    [self.sectionTitlesArray addObjectsFromArray:[allKeys sortedArrayUsingSelector:@selector(compare:)]];
    [self.sectionTitlesArray enumerateObjectsUsingBlock:^(NSString *zimu, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *smallArray = self.bigDic[zimu];
        [self.dataArray addObject:smallArray];
    }];
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImageData];
    [self loadData];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBackItem)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self setSearchBarToNavigationItemTitleView];
    
    

}
- (void)clickBackItem
{
    [self.navigationController popViewControllerAnimated:YES];
}
//添加搜索
-(void)setSearchBarToNavigationItemTitleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width *0.7, 30)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.barTintColor;
    
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    
    searchBar.delegate = self;
    searchBar.frame = titleView.bounds;
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 15;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:5];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    searchBar.placeholder = @"搜索贷款平台";
    [titleView addSubview:searchBar];
    
    //Set to titleView
    [self.navigationItem.titleView sizeToFit];
    self.navigationItem.titleView = titleView;
}

//-(void)shuzu
//{
//    NSArray *image =self.sectionTitlesArray[0];
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.sectionTitlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataArray[section] count];
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDPTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JDPTCell" forIndexPath:indexPath];
    //图片
    NSArray *imageArr = self.ImageArray[indexPath.section];
    cell.iconImageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
    //名称
    NSArray *array = self.dataArray[indexPath.section];
    
    cell.titleLb.text = array[indexPath.row];
    
    

    
    
    return cell;
    
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{

    return self.sectionTitlesArray;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitlesArray[section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
        //检测代理有没有实现:方法
        if([self.delegate respondsToSelector:@selector(getSelectedString:)]){
            NSArray *array = self.dataArray[indexPath.section];
            [self.delegate getSelectedString:array[indexPath.row]];
            NSLog(@"点中的:%@",array[indexPath.row]);
        }else{
            NSLog(@"代理没有实现方法");
        }
  
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewDidLayoutSubviews{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(30,15,50,30)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(30,15,50,30)];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsMake(30,70,60,30)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsMake(30,70,60,30)];
    }
}




@end
