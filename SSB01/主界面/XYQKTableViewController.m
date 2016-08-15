//
//  XYQKTableViewController.m
//  SSB01
//
//  Created by momode on 16/6/20.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XYQKTableViewController.h"
#import "xueliPopView.h"
#import "hunyinPopView.h"

#import "leixingPopView.h"
#import "guanxiyiPopView.h"
#import "guangxierPopView.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "LiangTools.h"
#import "HttpTool.h"



@interface XYQKTableViewController ()<xueliPopViewDelegate,hunyinPopViewDelegate,leixingPopViewDelegate,guanxiyiPopViewDelegate,guangxierPopViewDelegate,UIGestureRecognizerDelegate>

{
    xueliPopView *_popView;
    hunyinPopView *_popView2;
    
    leixingPopView *_popView5;
    guanxiyiPopView *_popView6;
    guangxierPopView *_popView7;
    
    
    CGPoint touchPoint;
    
}
@property BOOL isVisible;

@property (nonatomic,strong)NSMutableDictionary * userInfoDic;

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *shenfenzhenghao;


@property (weak, nonatomic) IBOutlet UITextField *qqhao;

@property (weak, nonatomic) IBOutlet UITextField *sheng;


@property (weak, nonatomic) IBOutlet UITextField *shi;




@property (weak, nonatomic) IBOutlet UITextField *juzhudi;


@property (weak, nonatomic) IBOutlet UITextField *dianhua;


@property (weak, nonatomic) IBOutlet UITextField *lianxiren1;


@property (weak, nonatomic) IBOutlet UITextField *lianxirendianhua1;


@property (weak, nonatomic) IBOutlet UITextField *lianxiren2;


@property (weak, nonatomic) IBOutlet UITextField *lianxirendianhua2;


@property (weak, nonatomic) IBOutlet UITextField *yinhangka;


@property (weak, nonatomic) IBOutlet UITextField *zhimajifen;


@property (weak, nonatomic) IBOutlet UITextField *danwei;



@property (weak, nonatomic) IBOutlet UITextField *danweidizhi;


@property (weak, nonatomic) IBOutlet UITextField *gongzuonianxian;


@property (weak, nonatomic) IBOutlet UITextField *nianshouru;


@property (weak, nonatomic) IBOutlet UITextField *shifouyouxinyongka;


@property (weak, nonatomic) IBOutlet UIButton *xuanle;
@property (nonatomic, strong) NSArray *array;

@property (weak, nonatomic) IBOutlet UILabel *xueliLabel;


@property (weak, nonatomic) IBOutlet UIButton *xunyin;
@property (nonatomic, strong) NSArray *array2;

@property (weak, nonatomic) IBOutlet UILabel *hunyinLabel;





@property (weak, nonatomic) IBOutlet UIButton *fangwuliexing;
@property (nonatomic,strong) NSArray *array5;

@property (weak, nonatomic) IBOutlet UILabel *zhufangLabel;



@property (weak, nonatomic) IBOutlet UIButton *lianxirenguanxi1;
@property(nonatomic,strong)NSArray *array6;

@property (weak, nonatomic) IBOutlet UILabel *lianxirenguanxiLabel1;





@property (weak, nonatomic) IBOutlet UIButton *lianxirenguanxi2;

@property (weak, nonatomic) IBOutlet UILabel *lianxirenguanxiLabel2;

@property (strong,nonatomic) NSArray * paramNames;
@property (strong,nonatomic) NSArray * labels;
@end

@implementation XYQKTableViewController


//-(void)isBill{
//    _userInfoDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfoDic"];
//    
//    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"GeRenGet" paramNames:@[@"strCellNumber",@"strPassWord"] paramValues:[NSArray arrayWithObjects:_userInfoDic.text,_password.text, nil] success:^(NSData * data) {
//        NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
//        NSLog(@"%@",dic);
//        NSString * result = dic[@"soap:Body"][@"GeRenGetResponse"][@"GeRenGetResult"];
//        if([result isEqualToString:@"1"]){
//            NSLog(@"提示登陆失败");
//        }else{
//            NSLog(@"提示登陆登陆成功，并把登陆信息存入本地");
//            NSData * data = [result dataUsingEncoding:NSUTF8StringEncoding];
//            NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            //把用户信息存入userDefault
//            [[NSUserDefaults standardUserDefaults] setValue:resultDic forKey:@"userInfoDic"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            NSLog(@"%@",resultDic);
//            
//            //
//            XGMMViewController *xgmm=[[XGMMViewController alloc]initWithlaomima:_password.text];
//            //
//            //            xgmm.laomima=_password.text;
//            //            NSLog(@"123123123123123123123%@",xgmm.laomima);
//            //回到主线程进行UI操作，0.5秒后跳出当前页面
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.navigationController popViewControllerAnimated:YES];
//                
//                if (self.block) {
//                    self.block(_username.text);
//                }
//            });
//            
//        }
//    }];
//    
//    //    [self.navigationController popViewControllerAnimated:YES];
//}
//
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getTouchPoint)];
    oneTap.delegate = self;
    oneTap.numberOfTouchesRequired = 1;
    [self.tableView addGestureRecognizer:oneTap];
    
    
    
    
    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"个人信息";
    
    //   self.navigationController.toolbarHidden = NO;
    
    
    
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //

    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
   
    
    _popView = [[xueliPopView alloc] initWithSuperView:self.xuanle items:self.array];
    _popView.delegate = self;
    _popView.layer.cornerRadius = 14;
    _popView.layer.masksToBounds = YES;
    _popView.PopBorderColor = [UIColor lightGrayColor];
    _popView.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    _popView2 = [[hunyinPopView alloc] initWithSuperView2:self.xunyin items2:self.array2];
    _popView2.delegate = self;
    _popView2.layer.cornerRadius = 14;
    _popView2.layer.masksToBounds = YES;
    _popView2.PopBorderColor2 = [UIColor lightGrayColor];
    _popView2.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    _popView5 = [[leixingPopView alloc] initWithSuperView5:self.fangwuliexing items5:self.array5];
    _popView5.delegate = self;
    _popView5.layer.cornerRadius = 14;
    _popView5.layer.masksToBounds = YES;
    _popView5.PopBorderColor5 = [UIColor lightGrayColor];
    _popView5.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    _popView6 = [[guanxiyiPopView alloc] initWithSuperView6:self.lianxirenguanxi1 items6:self.array6];
    _popView6.delegate = self;
    _popView6.layer.cornerRadius = 14;
    _popView6.layer.masksToBounds = YES;
    _popView6.PopBorderColor6 = [UIColor lightGrayColor];
    _popView6.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    
    _popView7 = [[guangxierPopView alloc] initWithSuperView7:self.lianxirenguanxi2 items7:self.array6];
    _popView7.delegate = self;
    _popView7.layer.cornerRadius = 14;
    _popView7.layer.masksToBounds = YES;
    _popView7.PopBorderColor7 = [UIColor lightGrayColor];
    _popView7.backgroundColor = [UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0];
    
    _userInfoDic = [NSMutableDictionary dictionaryWithDictionary:USERINFO];
    
    UIColor *yanse=[UIColor blackColor];
    _paramNames = @[@"name",@"card",@"qq",@"qualification",@"maritalstatus",@"area",@"area",@"address",@"hometype",@"homephone",@"linkmanone",@"relationone",@"linkphoneone",@"linkmantwo",@"relationtwo",@"linkphonetwo",@"bankcard",@"sesamecredit",@"unit",@"unitaddress",@"workinglife",@"wages",@"iscreditcard"];
    _labels = @[_name,_shenfenzhenghao,_qqhao,_xueliLabel,_hunyinLabel,_sheng,_shi,_juzhudi,_zhufangLabel,_dianhua,_lianxiren1,_lianxirenguanxiLabel1,_lianxirendianhua1,_lianxiren2,_lianxirenguanxiLabel2,_lianxirendianhua2,_yinhangka,_zhimajifen,_danwei,_danweidizhi,_gongzuonianxian,_nianshouru,_shifouyouxinyongka];
    for (int i = 0; i < _paramNames.count; i ++) {
        id label = _labels[i];
        [label setText:[_userInfoDic objectForKey:_paramNames[i]]];
        if (!(i < 3 || i == 5 || i == 6)) {
            [label setTextColor:yanse];
        }if (i == 5) {
            [label setText:[_userInfoDic[@"area"] componentsSeparatedByString:@"-"][0]];
        }else if (i == 6){
            [label setText:[_userInfoDic[@"area"] componentsSeparatedByString:@"-"][1]];
        }
    }

}
-(void)getTouchPoint
{
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 如果点击tableViewCell则不截获点击事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"XYQKTableViewController"]) {
        //获取点击坐标
        touchPoint = [touch locationInView:self.tableView];
        return NO;
    }
    NSLog(@"%.2f   %.2f",touchPoint.x,touchPoint.y);

    return  YES;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        NSLog(@"----%@",NSStringFromCGPoint(scrollView.contentOffset));
    }
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}


- (IBAction)BCbtn:(UIButton *)sender {
    NSLog(@"保存数据");
    if (!USERINFO) {
        [LiangTools showToastWithContent:@"请先登录"];
        return;
    }
    for (int i = 0; i < _paramNames.count; i ++) {
        if (i == 5 || i == 6 ) {
            [_userInfoDic setObject:[NSString stringWithFormat:@"%@-%@",_sheng.text,_shi.text] forKey:@"area"];
        }else{
            [_userInfoDic setObject:[_labels[i] text] forKey:_paramNames[i]];
        }
    }
    [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"GeRenUpdate" paramNames:@[@"strNew"] paramValues:@[[LiangTools dictionaryToJson:@{@"Geren":_userInfoDic}]] success:^(NSData *data) {
            NSDictionary * dic1 = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
        NSString * result = dic1[@"soap:Body"][@"GeRenUpdateResponse"][@"GeRenUpdateResult"];
        if (result && [result isEqualToString:@"0"]) {
            [LiangTools showToastWithContent:@"保存成功"];
            [[NSUserDefaults standardUserDefaults] setObject:_userInfoDic forKey:@"userInfoDic"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [LiangTools showToastWithContent:@"保存失败"];
        }
        }failure:^(NSError *error) {
            [LiangTools showToastWithContent:@"请求失败"];
        }];
    }

- (void)zdaddwithparam:(NSDictionary *)param
    {
        NSURLRequest *request = [LiangTools getRequestWithMethod:@"GeRenUpdate" forParameter:param withManner:@"POST"];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/xml"];
        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                NSString *xml = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *result = [LiangTools getWebServiceXMLResult:xml xpath:@"GeRenUpdateResult"];
                NSString *status = result[@"text"];
                if([status isEqualToString:@"1"]){
                    NSLog(@"账单上传失败");
                }else if([status isEqualToString:@"0"]){
                    NSLog(@"账单上传成功");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                    });
                    
                    
                }else{
                    
                }
            }else{
                NSLog(@"%@",error);
            }
        }];
        [task resume];
    }

    
    
    
    
    




- (NSArray *)array
{
    if (!_array) {
        _array = @[@"初中及以下",@"高中",@"专科",@"本科",@"硕士",@"博士及以上"];
    }
    return _array;
}
- (void)chooseButton:(NSString *)title
{
    self.xueliLabel.text=title;
}

- (IBAction)clickxueliBtn:(UIButton *)sender {
    [_popView showPopView];
    
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}

- (NSArray *)array2
{
    if (!_array2) {
        _array2 = @[@"未婚",@"已婚"];
    }
    return _array2;
}
-(void)chooseButton2:(NSString *)title
{
    self.hunyinLabel.text=title;
}


- (IBAction)clickhunyinBtn:(UIButton *)sender {
    [_popView2 showPopView2];
    [_popView xiaoshi];
   
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}


-(NSArray *)array5
{
    if (!_array5) {
        _array5=@[@"租房",@"按揭中",@"全款"];
    }
    return _array5;
}
-(void)chooseButton5:(NSString *)title
{
    self.zhufangLabel.text=title;
}

- (IBAction)zhufangBtn:(UIButton *)sender {
    [_popView5 showPopView5];
    [_popView xiaoshi];
    [_popView2 xiaoshi];
   
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
}


-(NSArray *)array6
{
    if (!_array6) {
        _array6=@[@"配偶",@"父母",@"兄弟姐妹",@"子女",@"同事",@"同学",@"朋友"];
    }
    return _array6;
}

-(void)chooseButton6:(NSString *)title
{
    self.lianxirenguanxiLabel1.text=title;
}


- (IBAction)clicklianxirenbtn1:(UIButton *)sender {
    [_popView6 showPopView6];
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
  
    [_popView7 xiaoshi];
}

-(void)chooseButton7:(NSString *)title
{
    self.lianxirenguanxiLabel2.text=title;
}


- (IBAction)clicklianxirenbtn2:(UIButton *)sender {
    [_popView7 showPopView7];
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
   
}




//- (NSArray *)array3
//{
//    if (!_array) {
//        _array = @[@"北京市",@"天津市",@"上海市",@"重庆市",@"河北省",@"山西省",@"内蒙古自治区",@"辽宁省",@"吉林省",@"黑龙江省",@"江苏省",@"浙江省",@"安徽省",@"福建省",@"江西省",@"山东省",@"河南省",@"湖北省",@"湖南省",@"广东省",@"广西壮族自治区",@"海南省",@"四川省",@"贵州省",@"云南省",@"西藏自治区",@"陕西省",@"甘肃省",@"青海省",@"宁夏回族自治区",@"新疆维吾尔自治区",@"香港",@"澳门",@"台湾省"];
//    }
//    return _array;
//}















#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

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
-(void)viewWillAppear:(BOOL)animated
{
                
    
    _isVisible=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    _isVisible=NO;
    [_popView xiaoshi];
    [_popView2 xiaoshi];
    [_popView5 xiaoshi];
    [_popView6 xiaoshi];
    [_popView7 xiaoshi];
  
    
    
    
}
@end
