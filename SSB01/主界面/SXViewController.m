//
//  SXViewController.m
//  联系001
//
//  Created by momode on 16/6/1.
//  Copyright © 2016年 momode. All rights reserved.
//



#import "SXViewController.h"
#import "XYPopView.h"
#import "QXPopView.h"
#import "SXCell.h"
#import "SXModel.h"


@interface SXViewController ()<XYPopViewDelegate,QXPopViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    XYPopView *_popView;
    QXPopView *_popView2;
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray<SXModel *> *allModel;
@property(nonatomic,strong)NSMutableArray<SXModel *> *dataSources;
@property (weak, nonatomic) IBOutlet UIButton *studentBtn;
@property (weak, nonatomic) IBOutlet UIButton *amountButton;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) NSArray *array;

/** cell */
@property (nonatomic,strong)SXCell *cell;
@property (weak, nonatomic) IBOutlet UIButton *amountButton2;

@property (weak, nonatomic) IBOutlet UILabel *amountLabel2;

@property(nonatomic,strong) NSArray *array2;

@property (nonatomic,strong) NSArray *imagez;

@property (nonatomic,strong) NSArray *btz;

@property (nonatomic,strong) NSArray *nrz;

@property BOOL isVisible;



@end





@implementation SXViewController
-(NSMutableArray<SXModel *> *)allModel{
    if (!_allModel) {
        _allModel = [NSMutableArray new];
        NSArray *images =  @[@"44",@"信用钱包",@"发薪",@"22",@"闪电借款",@"我来贷",@"贷款王",@"融360",@"豆豆钱图标",@"i贷图标",@"省呗图标",@"小赢卡贷图标",@"马上金融",@"功夫贷图标",@"氧气贷_03",@"宅e贷图标",@"55",@"u族图标",@"33",@"名校贷图标1",@"叮当贷图标"];
        
        NSArray *titles =@[@"手机贷",@"信用钱包",@"发薪贷",@"现金巴士",@"闪电借款",@"我来贷",@"贷款王",@"融360",@"豆豆钱",@"平安i贷",@"省呗",@"小赢卡贷",@"马上消费",@"功夫贷",@"氧气贷",@"宅e贷",@"拍拍贷",@"U族",@"闪银",@"名校贷",@"叮当贷"];
        
        NSArray *coment =@[@"适合经常在网上消费的人群",@"信用材料少,下款速度快",@"申请只需一张身份证",@"小额短期,无无限循环",@"需信用卡申请,速度较快",@"无需抵押,快速审批",@"适合收入稳定的非学生人群",@"借款额度范围大,类型齐全",@"申请审核简便,7天内免息",@"无抵押、无材料、无需上门",@"分期还款,信誉越好折扣越大",@"可用于信用卡快速还款",@"利息低,风控严格",@"秒级审批放款,还款方便",@"全程手机即可申请",@"有抵押贷款",@"下款速度通常为3小时",@"专属大学生的金融生活社区",@"一次申请,九次授信",@"备受大学生青睐的借款平台",@"老牌‘国家队’网贷平台"];
        
        NSArray *moneyMin = @[@"1000",@"3000",@"1000",@"500",@"1000",@"3000",@"3000",@"5000",@"5000",@"5000",@"5000",@"5000",@"8000",@"8000",@"20000",@"20000", @"3000",@"500",@"500",@"500",@"500"];
        
        
        NSArray *moneymax  =@[@"3000",@"5000",@"3000",@"1000",@"3000",@"20000",@"5000",@"0",@"8000",@"20000",@"8000",@"8000",@"20000",@"20000",@"0",@"0",@"0",@"1000",@"3000",@"1000",@"20000"];
        
        NSArray *qx = @[@"2",@"5",@"4",@"1",@"2",@"5",@"2",@"5",@"5",@"6",@"5",@"3",@"5",@"5",@"6",@"6",@"5",@"3",@"5",@"3",@"6"];
        
        NSArray *qxmax =@[@"4",@"7",@"7",@"2",@"3",@"7",@"3",@"7",@"7",@"7",@"7",@"7",@"7",@"7",@"7",@"7",@"7",@"5",@"7",@"5",@"7"];
        
        NSArray *sfxuesheng=@[@"0",@"0",@"0",@"0",@"0",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",@"1",@"1",@"1"];
        
        for (int i = 0; i<titles.count; i++) {
            SXModel *model = [[SXModel alloc]init];
            model.title = titles[i];
            model.image=images[i];
            model.commten=coment[i];
            model.moneymax=moneymax[i];
            model.moneymin=moneyMin[i];
            model.qxmin=qx[i];
            model.qxmax=qxmax[i];
            model.sfxuesheng=sfxuesheng[i];
            [_allModel addObject:model];
        }
        
    }
    
    return _allModel;
}
-(void)sxmodel:(NSString *)qx ForMoney:(NSString *)money{
    [self.dataSources removeAllObjects];
    self.dataSources = [NSMutableArray new];
    
    for (SXModel *model in self.allModel) {
        if ([qx isEqualToString:@"请选择"] && [money intValue]) {
            if ([self sxmodelForMoney:[money intValue] forModel:model]) {
                [self.dataSources addObject:model];
            }
        }
        if([money isEqualToString:@"请选择"] && [qx intValue]){
            if ([self sxmodeForQx:[qx intValue] forModel:model]) {
                [self.dataSources addObject:model];
            }
            
        }
        if ([money intValue] && ![qx isEqualToString:@"请选择"]) {
            if ([model.qxmin isEqualToString:qx] && [self sxmodelForMoney:[money intValue] forModel:model]) {
                [self.dataSources addObject:model];
            }else if ([model.qxmax isEqualToString:qx] && [self sxmodelForMoney:[money intValue] forModel:model]){
                [self.dataSources addObject:model];
            }
        }
        if ([qx intValue]&& ![money isEqualToString:@"请选择"] ) {
            if ([model.moneymin isEqualToString:money] && [self sxmodelForMoney:[qx intValue] forModel:model]) {
                [self.dataSources addObject:model];
            }else if ([model.moneymax isEqualToString:money] && [self sxmodelForMoney:[qx intValue] forModel:model]){
                [self.dataSources addObject:model];
            }

        }
//        else{
//            if ([money intValue]) {
//                if ([model.qxmin isEqualToString:qx] && [self sxmodelForMoney:[money intValue] forModel:model]) {
//                    [self.dataSources addObject:model];
//                }else if ([model.qxmax isEqualToString:qx] && [self sxmodelForMoney:[money intValue] forModel:model]){
//                    [self.dataSources addObject:model];
//                }
//            }else if([qx intValue] ){
//                if ([model.moneymin isEqualToString:money] && [self sxmodeForQx:[qx intValue] forModel:model]) {
//                    [self.dataSources addObject:model];
//                    
//                }else if([model.moneymax isEqualToString:money] && [self sxmodeForQx:[qx intValue] forModel:model]){
//                    [self.dataSources addObject:model];
//                    
//                }
//                    }

//            }else
//            
//            {
//                if ([model.qxmin isEqualToString:qx]) {
//                    [self.dataSources addObject:model];
//                }
       
    }
    
    [self.tableView reloadData];
}


-(BOOL)sxmodelForMoney:(int)money forModel:(SXModel *)model{
    if ([model.moneymax intValue] == 0) {
        if (money>=[model.moneymin intValue]) {
            return YES;
        }
    }else{
        if (money>=[model.moneymin intValue] && money <= [model.moneymax intValue]) {
            return YES;
        }
    }
    return NO;
    
}
-(BOOL)sxmodeForQx:(int )qx forModel:(SXModel *)model{
    if ([model.qxmax intValue]==0) {
        if (qx>=[model.qxmin intValue]) {
            return YES;
        }
    }else
    {
        if (qx>=[model.qxmin intValue] && qx<=[model.qxmax intValue]) {
            return YES;
        }
    }
    return NO;
    
}

//-(BOOL)sxmodelForMoney:(int)money forqx:(int)qx forModel:(SXModel *)model{
//    if ([model.moneymax intValue] == 0 || [model.qxmax intValue]== 0) {
//        if (money>=[model.moneymin intValue]||qx>=[model.qxmin intValue]) {
//            return YES;
//        }
//    }else{
//        if (money>=[model.moneymin intValue] && money <= [model.moneymax intValue] ) {
//            return YES;
//        }else if (qx>=[model.moneymin intValue] && qx<=[model.qxmax intValue]) {
//            return YES;
//        }
//    }
//    return NO;
//}



-(NSMutableArray<SXModel *> *)dataSources{
    if (!_dataSources) {
        _dataSources = nil;
    }
    return  _dataSources;
}
-(NSArray *)imagez
{
    if (!_imagez) {
        _imagez = nil;
        
    }
    return _imagez;
}

-(NSArray *)btz
{
    if (!_btz) {
        _btz =nil;
        
    }
    return _btz;
}
-(NSArray *)nrz
{
    if (!_nrz) {
        _nrz = nil;
        
    }
    return _nrz;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //   self.navigationController.toolbarHidden = NO;
    
    
    
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];

 
    
    UIView *bt=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    bt.backgroundColor=[UIColor blackColor];
    [self.view addSubview:bt];
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    _popView = [[XYPopView alloc] initWithSuperView:self.amountButton items:self.array];
    
    _popView.delegate = self;
    _popView.layer.cornerRadius = 14;
    _popView.layer.masksToBounds = YES;
    _popView.PopBorderColor = [UIColor whiteColor];
    _popView.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    _popView2 = [[QXPopView alloc] initWithSuperView2:self.amountButton2 items2:self.array2];
    _popView2.delegate = self;
    _popView2.layer.cornerRadius = 14;
    _popView2.layer.masksToBounds = YES;
    _popView2.PopBorderColor2 = [UIColor whiteColor];
    _popView2.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
}



//是否是学生
- (IBAction)clickStudentBtn:(UIButton *)sender {
    self.studentBtn.selected = !self.studentBtn.selected;
    
    [self.dataSources removeAllObjects];
    
    if (self.studentBtn.selected==NO) {
        
       
        NSLog(@"11111")   ; }
    [self bushixuesheng];
    //    [self.tableView reloadData];
    if (self.studentBtn.selected==YES) {
        NSLog(@"123");
        [self shixuesheng];
       
        //        [self.tableView reloadData];
    }
    self.amountLabel.text=@"请选择";
    self.amountLabel2.text=@"请选择";
    [self.tableView reloadData];
}
-(void)shixuesheng
{
    self.imagez=@[@"u族图标",@"闪银",@"名校贷图标1",@"拍拍贷",@"我来贷",@"叮当贷图标"];
    self.btz=@[@"U族",@"闪银",@"名校贷",@"拍拍贷",@"我来贷",@"叮当贷"];
    self.nrz=@[@"专属大学生的金融生活社区",@"一次申请，九次授信",@"备受大学生青睐的借款平台",@"下款速度通常为三小时",@"放款最快的年轻人借款平台",@"老牌'国家队'网贷平台"];
}
-(void)bushixuesheng
{
    self.imagez=nil;
    self.btz=nil;
    self.nrz=nil;
}



-(IBAction)clickSelectEduBtn:(UIButton *)sender {
    
    
    [_popView showPopView];
    
    [_popView2 xiaoshi2];
    self.studentBtn.selected=NO;
}

- (IBAction)cliclSelectEduBtn2:(UIButton *)sender {
    
    [_popView2 showPopView2];
    self.studentBtn.selected=NO;
    [_popView xiaoshi];
}



- (NSArray *)array
{
    if (!_array) {
        _array = @[@"500",@"1000",@"3000",@"5000",@"8000",@"20000",@"20000以上"];
    }
    return _array;
}

- (NSArray *)array2
{
    if (!_array2) {
        _array2 = @[@"一周",@"两周",@"一个月",@"两个月",@"三个月",@"六个月",@"一年"];
    }
    return _array2;
}


//- (void)click:(UIButton *)sender
//{
//    [_popView showPopView];
//    
//}
//- (void)click2:(UIButton *)sender
//{
//    [_popView2 showPopView2];
//}


- (void)chooseButton:(NSString *)title
{
    
    self.amountLabel.text = title;
    [self sxmodel:self.amountLabel2.text ForMoney:self.amountLabel.text];
    
    
}

- (void)chooseButton2:(NSString *)title
{
    
//    _array2 = @[@"1",@"2",@"4",@"8",@"12",@"24",@"48"];
    
    
    self.amountLabel2.text = title;
    
    if ([self.amountLabel2.text isEqualToString:@"一周"])
    {
        NSString *a=@"1";
    [self sxmodel:a ForMoney:self.amountLabel.text];
   
    }else if ([self.amountLabel2.text isEqualToString:@"两周"])
    {
        NSString *a=@"2";
        [self sxmodel:a ForMoney:self.amountLabel.text];
        
    }else if ([self.amountLabel2.text isEqualToString:@"一个月"])
    {
        NSString *a=@"3";
        [self sxmodel:a ForMoney:self.amountLabel.text ];
        
    }else if ([self.amountLabel2.text isEqualToString:@"两个月"])
    {
        NSString *a=@"4";
        [self sxmodel:a ForMoney:self.amountLabel.text];
        
    }else if ([self.amountLabel2.text isEqualToString:@"三个月"])
    {
        NSString *a=@"5";
        [self sxmodel:a ForMoney:self.amountLabel.text ];
        
    }else if ([self.amountLabel2.text isEqualToString:@"六个月"])
    {
        NSString *a=@"6";
        [self sxmodel:a ForMoney:self.amountLabel.text];
        
    }else if ([self.amountLabel2.text isEqualToString:@"一年"])
    {
        NSString *a=@"7";
        [self sxmodel:a ForMoney:self.amountLabel.text];
        
    }

    
    
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    [_popView2 xiaoshi2];
    [_popView xiaoshi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.studentBtn.selected?self.btz.count:self.dataSources.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SXCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SXCell"];
    self.cell = cell;
    if (cell==nil) {
        cell=[[SXCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SXCell"];
    }
    if (self.studentBtn.selected==NO) {
        SXModel *model = self.dataSources[indexPath.row];
        
        cell.SXImage.image = [UIImage imageNamed:model.image];
        cell.SXbt.text = model.title;
        cell.SXnr.text = model.commten;
        
    }if(self.studentBtn.selected==YES)
    {
        cell.SXImage.image = [UIImage imageNamed:self.imagez[indexPath.row]];
        cell.SXbt.text = self.btz[indexPath.row];
        cell.SXnr.text = self.nrz[indexPath.row];
        
        
    }
   
    
   
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.dataSources.count != 0) {
      NSString *str= self.dataSources[indexPath.row].title;//@"U族",@"闪银",@"名校贷",@"拍拍贷",@"我来贷",@"叮当贷"
        if ([str isEqualToString:@"U族"]) {
            uzViewController *uvc = [self.storyboard instantiateViewControllerWithIdentifier:@"uzViewController"];
            [self.navigationController pushViewController:uvc animated:YES];
           

        }else if ([str isEqualToString:@"闪银"]){
            syViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
            [self.navigationController pushViewController:svc animated:YES];
        }else if ([str isEqualToString:@"名校贷"]){
            mxdViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
            [self.navigationController pushViewController:mvc animated:YES];
        }else if ([str isEqualToString:@"拍拍贷"]){
            ppdViewController *ppVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ppdViewController"];
            [self.navigationController pushViewController:ppVC animated:YES];
        }else if ([str isEqualToString:@"我来贷"]){
            wldViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wldViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"现金巴士"]){
            xjbsViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xjbsViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"功夫贷"]){
            gfdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"gfdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"省呗"]){
            sbViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sbViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"名校贷"]){
            mxdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"发薪贷"]){
            fxdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"fxdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"豆豆钱"]){
            ddqViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ddqViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"好贷"]){
            hdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"马上消费"]){
            msjrViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"msjrViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"闪银"]){
            syViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"闪电借款"]){
            sddkViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sddkViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"手机贷"]){
            sjdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sjdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"拍拍贷"]){
            ppdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ppdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"i贷"]){
            padViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"padViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"融360"]){
            r360ViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"r360ViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"小赢卡贷"]){
            xykdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xykdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"信用钱包"]){
            xyqbViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xyqbViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"U族"]){
            uzViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"uzViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"氧气贷"]){
            yqdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"yqdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"宅e贷"]){
            wldViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"zedViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"平安普惠"]){
            pahpViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pahpViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"贷款王"]){
            dkwViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"dkwViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"叮当贷"]){
            dddViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"dddViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        
        NSLog(@"点中了第%@",str);
    }
    else{//@"名校贷",@"拍拍贷",@"我来贷",@"叮当贷"
        NSString *str = self.btz[indexPath.row];
        if ([str isEqualToString:@"U族"]) {
            uzViewController *uvc = [self.storyboard instantiateViewControllerWithIdentifier:@"uzViewController"];
            [self.navigationController pushViewController:uvc animated:YES];
        }else if ([str isEqualToString:@"闪银"]){
            syViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
            [self.navigationController pushViewController:svc animated:YES];
        }else if ([str isEqualToString:@"名校贷"]){
            mxdViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
            [self.navigationController pushViewController:mvc animated:YES];
        }else if ([str isEqualToString:@"拍拍贷"]){
            ppdViewController *ppVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ppdViewController"];
            [self.navigationController pushViewController:ppVC animated:YES];
        }else if ([str isEqualToString:@"我来贷"]){
            wldViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wldViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"现金巴士"]){
            xjbsViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xjbsViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"功夫贷"]){
            gfdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"gfdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"省呗"]){
            sbViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sbViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"名校贷"]){
            mxdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mxdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"发薪贷"]){
            fxdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"fxdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"豆豆钱"]){
            ddqViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ddqViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"好贷"]){
            hdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"hdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"马上消费"]){
            msjrViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"msjrViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"闪银"]){
            syViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"syViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"闪电借款"]){
            sddkViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sddkViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"手机贷"]){
            sjdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sjdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"拍拍贷"]){
            ppdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ppdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"i贷"]){
            padViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"padViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"融360"]){
            r360ViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"r360ViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"小赢卡贷"]){
            xykdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xykdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"信用钱包"]){
            xyqbViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"xyqbViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"U族"]){
            uzViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"uzViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"氧气贷"]){
            yqdViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"yqdViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"宅e贷"]){
            wldViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"zedViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"平安普惠"]){
            pahpViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pahpViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }else if ([str isEqualToString:@"贷款王"]){
            dkwViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"dkwViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        else if ([str isEqualToString:@"叮当贷"]){
            dddViewController *wldVC = [self.storyboard instantiateViewControllerWithIdentifier:@"dddViewController"];
            [self.navigationController pushViewController:wldVC animated:YES];
        }
        
        NSLog(@"点中了第%@",str);
        
        
        
    }
    [_popView2 xiaoshi2];
    [_popView xiaoshi];
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


-(void)viewWillAppear:(BOOL)animated
{
   self.tabBarController.tabBar.hidden=NO;
    
    _isVisible=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    _isVisible=NO;
    [_popView2 xiaoshi2];
    [_popView xiaoshi];
}


@end
