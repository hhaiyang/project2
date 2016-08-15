//
//  ZDViewController.m
//  SSB01
//
//  Created by momode on 16/5/27.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "ZDViewController.h"
#import "ZDAddViewController.h"
#import "ZDCell.h"
#import "TXViewController.h"
#import "DLZCViewController.h"
#import "LJHKTViewController.h"
#import "CPZDModel.h"
#import "CPCell.h"
#import "CPHeaderView.h"
#import "SWTableViewCell.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "CPZDModel.h"
#import "ZDCell.h"
#define LINESPACE 20
static  NSMutableArray *httpUrls ;//全局变量
static NSString *CPCellId = @"CPCellId";
@interface ZDViewController ()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate,CpHeaderViewDelegate>
{
    BOOL _hasPushToDLZC;
}
@property (nonatomic,strong)UILabel *yipai;
@property (nonatomic,strong)UILabel *erpai;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic,strong)NSMutableArray *dayArray;
@property (nonatomic,strong)NSMutableArray *moneyArray;
@property (nonatomic,strong)UIImage *firstp;
@property (nonatomic,weak)UIImageView *tuView;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,weak)UIImageView *xuKuangView;
@property float jine;
@property int jibi;
@property (nonatomic,strong)LJHKTViewController *ljhkt;
@property (nonatomic,copy) NSString *chuanname;
@property (nonatomic,copy) NSString *chuanmoney;
@property (nonatomic,copy) NSString *chuantu;
@property (nonatomic, strong) NSMutableArray *tableViewModelArray;

@end
@implementation ZDViewController
//获取账单 获取的账单赋值给tableViewCell中
-(void)viewWillAppear:(BOOL)animated
{
    [self isBill];
}
- (void)getzdlistWithUserName:(NSString *)username
{
    if(username.length == 0 && username == nil){
        return;
    }
    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"ZDList" paramNames:@[@"userName"] paramValues:[NSArray arrayWithObjects:username, nil] success:^(NSData * data) {
        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSLog(@"%@",dic);
        NSString * result = dic[@"soap:Body"][@"ZDListResponse"][@"ZDListResult"];
        if([result isEqualToString:@"1"]){
            //失败
            [LiangTools showToastWithContent:@"获取账单信息失败"];
            NSLog(@"获取账单信息失败");
        }else if(result){
            //有账单数据
            [LiangTools showToastWithContent:@"获取账单信息成功"];
            NSDictionary * resutlDic = [LiangTools dictionaryWithJsonString:result];
            NSLog(@"2222222账单信息：%@",resutlDic);
            [self dealDataWithDic:resutlDic];
            //            NSString *money = @"1800";//money就是
            //            [self setyipaiString:money];
        }else{
            //未返回数据
            [LiangTools showToastWithContent:@"未发现有账单数据"];
            NSLog(@"未发现有账单数据");
        }
    }failure:^(NSError *error) {
        [LiangTools showToastWithContent:@"请求失败"];
    }];
}
- (void)setyipaiString:(NSString *)string
{
    UIView *superview = _yipai.superview;
    if (superview == nil) {
        return;
    }
    [_yipai removeFromSuperview];
    _yipai = nil;
    _yipai=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4, 40, self.view.frame.size.width-160, 25)];
    _yipai.bounds=CGRectMake(0, 0, self.view.frame.size.width-160, 1000) ;
    _yipai.textColor=[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    [_yipai setNumberOfLines:0];
    _yipai.font = [UIFont fontWithName:@"Helvetica" size:18];
    _yipai.lineBreakMode = NSLineBreakByCharWrapping;
    _yipai.attributedText = [self getAttributedStringWithString:string lineSpace:5];
    [superview addSubview:_yipai];
}
-(void)isBill{
    if (USERINFO) {//已登录
        NSLog(@"%@",USERINFO);
        //获取账单信息
        [self getzdlistWithUserName:USERINFO[@"username"]];
        
    }else{
        if (_hasPushToDLZC) {
            return;
        }
        UIStoryboard *sb = self.storyboard;
        DLZCViewController *dlzc = [sb instantiateViewControllerWithIdentifier:@"DLZCViewController"];
        [dlzc setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:dlzc animated:YES];
        _hasPushToDLZC = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _hasPushToDLZC = NO;
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"账单";
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    UIImageView *touView=[[UIImageView alloc]init];
    [touView setImage:[UIImage imageNamed:@"没有文字.png"]];
    touView.frame=CGRectMake(20, 10, self.view.frame.size.width-40, 120);
    [self.view addSubview:touView];
    [self yipai];
    [self erpai];
    [touView addSubview:_yipai];
    [touView addSubview:_erpai];
    [self tianjiatupian];
    [self tianjiaxukuang];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payback:) name:@"paybackAccount" object:nil];
    if (self.titleArray.count !=  0) {
        self.tableView.hidden = NO;
        self.tuView.hidden = YES;
        self.xuKuangView.hidden = YES;
    }else{
        self.tableView.hidden = YES;
        self.tuView.hidden = NO;
        self.xuKuangView.hidden = NO;
    }
    [self initTableView];
    [self initData];
    self.tableView.tableFooterView = [[UIButton alloc] init];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)initdata{
    self.tableViewModelArray=[[NSMutableArray alloc]init];
}
-(void)dealDataWithDic:(NSDictionary *)dic
{
    [self.tableViewModelArray removeAllObjects];
    for (NSDictionary * tempDic in dic[@"Weihuan"]) {
        CPZDModel *model = [CPZDModel zdmodelWithDict:tempDic];
        model.isYiHuan = NO;
        [self.tableViewModelArray addObject:model];
    }
    for (NSDictionary * tempDic in dic[@"Yihuan"]) {
        CPZDModel *model = [CPZDModel zdmodelWithDict:tempDic];
        model.isYiHuan = YES;
        [self.tableViewModelArray addObject:model];
    }
    [self reloadData];
}
-(void)reloadData{
    _jibi = 0;
    _jine = 0;
    for (CPZDModel * model in _tableViewModelArray) {
        if (!model.isYiHuan && model.isInOneMonth) {
            _jibi ++;
            _jine += [model.ZDAmountPer floatValue];
        }
    }
    _yipai.text = [NSString stringWithFormat:@"%.2f",_jine];
    //    [self setyipaiString:[NSString stringWithFormat:@"%.2f",_jine]];
    _erpai.text = [NSString stringWithFormat:@"最近30天应还(元)%d笔",_jibi];
    [self.tableView reloadData];
}
- (void)payback:(NSNotification *)text{
    
    text.userInfo[@"payBackLabel"] ;
    text.userInfo[@"payBackTimeLabel"];
    text.userInfo[@"mouthPayTextField"];
    text.userInfo[@"totalTextField"];
    text.userInfo[@"currentTextField"];
    text.userInfo[@"firstTextField"];
    text.userInfo[@"remark"];
    
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"dd"];
    NSDate *d=[date dateFromString:text.userInfo[@"payBackTimeLabel"]];
    NSString *str = [NSString stringWithFormat:@"%@",d];
    [self.titleArray addObject:text.userInfo[@"payBackLabel"]];
    [self.dayArray addObject:str];
    [self.moneyArray addObject:text.userInfo[@"mouthPayTextField"]];
    
    NSLog(@"%zd-%@",self.titleArray.count,text.userInfo[@"payBackLabel"]);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
    
}
-(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    return attributedString;
}
-(void)tianjiatupian
{
    UIImageView *tuView=[[UIImageView alloc]init];
    [tuView setImage:[UIImage imageNamed:@"xiaotu.png"]];
    
    tuView.bounds=CGRectMake(0, 0, 120, 120);
    tuView.frame=CGRectMake(self.view.frame.size.width/5*1.8, self.view.frame.size.height/3, self.view.frame.size.width/3.5, self.view.frame.size.height/6);
    [self.view addSubview:tuView];
    self.tuView = tuView;
    
}

-(void)tianjiaxukuang
{
    UIImageView *xukuangView=[[UIImageView alloc]init];
    [xukuangView setImage:[UIImage imageNamed:@"kukuang2.png"]];
    
    
    xukuangView.frame=CGRectMake(0, self.view.frame.size.height/12*8, self.view.frame.size.width, self.view.frame.size.height/15);
    [self.view addSubview:xukuangView];
    self.xuKuangView = xukuangView;
}

- (IBAction)clickAddItem:(id)sender
{
    NSLog(@"点中了右上角的\" + \"item");
    ZDAddViewController *zdaddvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ZDAddViewController"];
    zdaddvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:zdaddvc animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    //添加的tableView
    //    [self initData];
    //    [self initTableView];
}
- (void)initData{
    
    self.tableViewModelArray = [[NSMutableArray alloc]init];
    //    [self reloadData];
    
}
- (void)initTableView{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.height - 140 - 49 - 64) style:UITableViewStylePlain];
        
        //        _tableView.layer.borderColor = [UIColor redColor].CGColor;
        //        _tableView.layer.borderWidth = 1.0f;
        [self.view addSubview:_tableView];
        //        [_tableView registerClass:[CPCell class] forCellReuseIdentifier:CPCellId];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CpHeaderViewDelegate
- (void)paynowWithModel:(CPZDModel *)model
{
    NSLog(@"model:%@",model);
    LJHKTViewController *ljh=[[LJHKTViewController alloc]init];
    
    //    下面传数据
    ljh.model = model;
    
    [self.navigationController pushViewController:ljh animated:YES];
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.tableViewModelArray.count == 0) {
        tableView.hidden = YES;
    }else{
        tableView.hidden = NO;
    }
    return self.tableViewModelArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZDCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CPCellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZDCell" owner:nil options:nil]firstObject];
    }
    CPZDModel *cellModel = [self.tableViewModelArray objectAtIndex:indexPath.row];
    cell.model = cellModel;
    
    cell.clickAction = ^(CPZDModel * model){
        LJHKTViewController *ljh=[[LJHKTViewController alloc]init];
        ljh.model = model;
        [ljh setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:ljh animated:YES];
    };
    return cell;
}
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:35/255.0f green:101/255.0f blue:230/255.0f alpha:1.0]
                                                title:@"删除"];
    return rightUtilityButtons;
}
- (void)deleteZdWithUid:(NSString *)uid indexPath:(NSIndexPath *)indexpath
{
    //    ZDDel
    if (uid.length == 0 || uid == nil || [uid isEqualToString:@""]) {
        return;
    }
    
    
    [self.tableViewModelArray removeObjectAtIndex:indexpath.section];
    [self.tableView reloadData];
    
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark -action

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CPZDModel * model = self.tableViewModelArray[indexPath.row];
    model.isExpand = !model.isExpand;
    if (model.isExpand==YES) {
        
    }
    [tableView reloadData];
    NSLog(@"点中了第%ld组第%ld个cell",indexPath.section,indexPath.row);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPZDModel * model = self.tableViewModelArray[indexPath.row];
    if (model.isExpand) {
        return 150;
    }
    return 110;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CPZDModel * model = _tableViewModelArray[indexPath.row];
        [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"ZDDel" paramNames:@[@"uid"] paramValues:@[model.ZDUid] success:^(NSData * data) {
            NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
            NSLog(@"%@",dic);
            NSString * result = dic[@"soap:Body"][@"ZDDelResponse"][@"ZDDelResult"];
            if ([result isEqualToString:@"0"]) {
                [LiangTools showToastWithContent:@"删除账单成功"];
                [_tableViewModelArray removeObject:model];
                [self reloadData];
            }else{
                [LiangTools showToastWithContent:@"删除账单失败"];
                NSLog(@"删除账单失败");
            }
        }failure:^(NSError *error) {
            [LiangTools showToastWithContent:@"请求失败"];
        }];
    }
}



#pragma mark - InitData-View
-(UILabel *)yipai
{
    if (!_yipai) {
        _yipai=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, self.view.frame.size.width-80, 25)];
        //        _yipai.backgroundColor =[UIColor redColor];
        NSString *string=@"良 好 的 消 费 习 惯";
        _yipai.textColor=[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [_yipai setNumberOfLines:0];
        _yipai.font = [UIFont fontWithName:@"Helvetica" size:18];
        _yipai.lineBreakMode = NSLineBreakByCharWrapping;
        _yipai.textAlignment = NSTextAlignmentCenter;
        _yipai.text = string;
        //        _yipai.attributedText = [self getAttributedStringWithString:string lineSpace:5];
    }
    return _yipai;
}
-(UILabel *)erpai
{
    if (!_erpai) {
        self.erpai=[[UILabel alloc]initWithFrame:CGRectMake(20, 40+30, self.view.frame.size.width-80, 25)];
        NSString *string1=@"从 记 账 开 始";
        _erpai.textColor=[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        [_erpai setNumberOfLines:0];
        _erpai.font = [UIFont fontWithName:@"Helvetica" size:18];
        _erpai.lineBreakMode = NSLineBreakByCharWrapping;
        _erpai.textAlignment = NSTextAlignmentCenter;
        _erpai.text = string1;
        //        _erpai.attributedText = [self getAttributedStringWithString:string1 lineSpace:5];
    }
    return _erpai;
}
-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] init];
    }
    return _titleArray;
}
-(NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc] init];
    }
    return _imageArray;
}
-(NSMutableArray *)dayArray
{
    if (!_dayArray) {
        _dayArray = [[NSMutableArray alloc] init];
    }
    return _dayArray;
}
-(NSMutableArray *)moneyArray
{
    if (!_moneyArray) {
        _moneyArray = [[NSMutableArray alloc] init];
    }
    return _moneyArray;
}
//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
//    {
//        [cell setSeparatorInset:UIEdgeInsetsMake(0,15,0,15)];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
//    {
//        [cell setLayoutMargins:UIEdgeInsetsMake(0,15,0,15)];
//    }
//}
@end