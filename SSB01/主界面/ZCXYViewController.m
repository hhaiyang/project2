//
//  ZCXYViewController.m
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "ZCXYViewController.h"
#import "ZCXYTableViewCell.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ZCXYViewController ()<UITableViewDelegate,UITableViewDataSource>

/**  属性  **/
@property(nonatomic,strong)UITableView *tableView;
/**  属性  **/
@property(nonatomic,strong)NSArray *alltitleArr;
/**  属性  **/
@property(nonatomic,strong)NSArray *alldescArr;



@end

@implementation ZCXYViewController



- (NSArray *)alltitleArr
{
    if (!_alltitleArr) {
        _alltitleArr = @[@"服务条款",@"隐私保护",@"免责事由",@"用户承诺",@"服务终止或中止",@"法律适用"];
    }
    return _alltitleArr;
}

- (NSArray *)alldescArr
{
    if (!_alldescArr) {
        _alldescArr = @[@"分期管家各项服务的所有权和运营权归杭州云兔科技有限公司，任何单位和个人非经本公司授权不得以本公司及产品名义进行商业或非商业活动。您应当在使用分期管家服务之前认真阅读全部协议内容，只要您事实上使用分期管家服务，则本协议对您产生约束。用户一旦使用分期管家的各项服务（包含但不限于帮你还业务等），则视为同意该服务匹配的相应协议。分期管家有权在必要时修改服务条款，服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以在与本公司取得联系后取消获得的服务。如果用户继续享用服务，则视为接受服务条款的变动。分期管家保留随时修改或中断服务而不需提前告知用户的权利。分期管家行使修改或中断服务的权利，不需对用户或第三方负责。\n分期管家有权在必要时修改服务条款，服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以在与本公司取得联系后取消获得的服务。如果用户继续享用服务，则视为接受服务条款的变动。分期管家保留随时修改或中断服务而不需提前告知用户的权利。分期管家行使修改或中断服务的权利，不需对用户或第三方负责。",@"用户一旦注册成功，成为分期管家的合法用户，将通过手机号和实时验证码进行登录，由用户对用户名安全负全部责任。另外，每个用户都要对以其用户名进行的所有活动和事件负全责。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告分期管家。分期管家尊重用户个人隐私，未经合法用户授权，本平台不会在公开、编辑或透露其注册资料及保存在本平台的非公开内容，除非有法律许可要求或未经合法用户授权在诚信的基础上认为透露这些信息是必要的：\n(1)用户授权本平台或授权某人通过电子邮件服务透露这些信息。\n(2)相应的法律及程序要求本平台提供用户的个人资料。\n(3)遵守有关法律规定，遵从本平台合法服务程序。\n(4)保持维护本平台的商标所有权。\n(5)在紧急情况下竭力维护用户个人和社会大众的隐私安全。\n(6)符合其他相关的要求。",@"（1）分期管家对用户在接受服务过程中所受的任何直接、间接的损害不负责任，这些损害可能来自：不正当使用网络服务，在网上购买商品或进行同类型服务，在网上进行交易，非法使用网络服务或用户传送的信息有所变动等。\n（2）分期管家不对用户所发布信息的删除或储存失败负责。分期管家有判定用户的行为是否符合本平台服务条款的要求和精神的保留权利，如果用户违背了服务条款的规定，分期管家有中断对其提供网络服务的权利。\n（3）对用户自行提供的信息，由用户依法自行承担全部责任。分期管家对此等信息的准确性、完整性、合法性或真实性均不承担任何责任。\n（4）用户在本平台所发表的任何意见均属于个人意见，并不代表杭州云兔科技有限公司及分期管家也持同样的观点。",@"用户自行承担发布内容的责任。用户对服务的使用是根据所有适用于国家法律、地方法律和国际法律准则的规定的。 用户必须遵循：\n(1)用户必须提供真实的自我信息，对其在本网站上发布的信息负责全部责任。\n(2)从中国境内向外传输资料信息时必须符合中国有关法规。\n(3)使用网络服务不作非法用途。\n(4)不干扰或攻击网络服务。\n(5)遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输任何教唆他人构成犯罪行为的资料；不能传输涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。禁止未经许可而非法进入其它电脑系统。用户需对自己在网上的行为承担法律责任。用户若在分期管家上散布和传播反动、色情或其他违反国家法律的信息，本平台系统记录有可能作为用户违反法律的证据。分期管家有权对违法行为作出独立判断并立即取消用户服。",@"分期管家和用户可根据合同约定或实际情况终止、中止一项或多项网络服务。分期管家不需对任何个人或第三方负责而随时中止服务。用户对后来的条款修改有异议，或对本网的服务不满，可以行使如下权利：\n(1)停止使用本平台的服务。\n(2)通告本平台停止对该用户的服务。 结束用户服务后，用户使用网络服务的权利立即终止或中止。从终止或中止之时，用户没有权利，本平台也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。",@"本网网络服务条款与中华人民共和国的法律解释相一致，用户和分期管家一致同意服从中华人民共和国法律的管辖。如发生分期管家服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户产生法律效力和影响。"];
    }
    return _alldescArr;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"用户注册协议";
    
    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 74, SCREEN_WIDTH, 44)];
    headerView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:headerView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 84, 300, 30)];
    label.text = @"《现金贷用户注册协议》";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor darkGrayColor];


    
    [self.view addSubview:label];
    
    [self creatTableView];


}
    
- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_WIDTH, SCREEN_HEIGHT-120) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = NO;
    [self.view addSubview:self.tableView];
    
    
    
}

    



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.alltitleArr.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    ZCXYTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ZCXYTableViewCell"];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"ZCXYTableViewCell" owner:nil options:nil].firstObject;
        
    }
    cell.descLabel.text = self.alltitleArr[indexPath.row];
    cell.ziLabel.text = self.alldescArr[indexPath.row];
    cell.ziLabel.lineBreakMode = UILineBreakModeWordWrap;
   cell.ziLabel.numberOfLines = 0;
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat row=indexPath.row;
    NSString *detail=[self.alldescArr objectAtIndex:row];
    CGFloat nameLab=140;
    CGSize rect = [detail boundingRectWithSize:CGSizeMake( SCREEN_WIDTH , 1000) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes: @{NSFontAttributeName :[UIFont systemFontOfSize:18]} context:nil].size;
    
    
    return (rect.height)+nameLab ;
    
//    ZCXYTableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
