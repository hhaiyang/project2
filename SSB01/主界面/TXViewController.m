//
//  TXViewController.m
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "TXViewController.h"
#import "XGMMViewController.h"
#import "MYViewController.h"
#import "DLZCViewController.h"
#import "HttpTool.h"
#import "XMLDictionary.h"
#import "MYViewController.h"
#import "UIImageView+WebCache.h"
@interface TXViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *DHHLabel;



@end

@implementation TXViewController

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden=YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIView *TView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 20)];
    TView.backgroundColor=[UIColor grayColor];
    [self.navigationController.navigationBar addSubview:TView];
    self.view.backgroundColor=[ UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1] ;
    self.title=@"个人信息";

    UIColor * color = [UIColor whiteColor];
    //
    //        //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    //
    //        //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:35/255.0 green:101/255.0 blue:230/255.0 alpha:0]];
    self.txImage.userInteractionEnabled = YES;
    _txImage.layer.cornerRadius = 35;
    _txImage.layer.masksToBounds = YES;
    //初始化手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeImage:)];
    //给头像添加手势
    [self.txImage addGestureRecognizer:singleTap];
    NSString *str=USERINFO[@"headimg"];
    NSString *yuanurl=@"http://we.liulongzhu.com";
    NSURL *tupianurl=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",yuanurl,str]];
    
    
    [self.txImage sd_setImageWithURL:tupianurl placeholderImage:[UIImage imageNamed:@"头像_03"]];
//    NSString * imageUrl = []
//    [self.txImage sd_setImageWithURL:[NSURL URLWithString:<#(nonnull NSString *)#>]];
    self.TXusername.textColor=[UIColor grayColor];
    
//    [self zhanghaolable];
    if ([self.firstValue isEqualToString:@"登录/注册"]) {
        self.TXusername.text=nil;
    }else{
    [self.TXusername setText:self.firstValue];
    }
}



//-(void)zhanghaolable
//{
//    DLZCViewController *lVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DLZCViewController"];
//    lVC.block=^(NSString *name){
//        if (name!=nil && name.length>0){
//            self.DHHLabel.text=name;
//            
//        }
//    };
//}


- (void)changeImage:(UITapGestureRecognizer *)sender
{
    if (IOS8) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"上传照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault    handler:^(UIAlertAction * action) {
            [self takePhoto];
            //            NSLog(@"打开相机");
        }];
        
        UIAlertAction* galleryAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
            [self LocalPhoto];
            NSLog(@"本地相册");
        }];
        
        UIAlertAction * defaultAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            NSLog(@"Cancel is clicked");
        }];
        
        [alertController addAction:cameraAction];
        [alertController addAction:galleryAction];
        [alertController addAction:defaultAct];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
        [actionSheet setExclusiveTouch:YES];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        [actionSheet showInView:self.view];
        actionSheet.tag=12;
    }
    
}
//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType =UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate=self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        NSLog(@"模拟器无法打开相机,在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
}


//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    NSString *pickCustomType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([pickCustomType isEqualToString:@"public.image"]) {
        
        
        UIImage *images = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        [preferences setObject:UIImagePNGRepresentation(images) forKey:@"images"];
//        self.txImage.image = images;
        
        [self uploadImagedata:UIImageJPEGRepresentation(images,0.9)];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        //使有照相机照的照片
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            //保存到当地 并调用成didFinishSavingWithError方法
            UIImageWriteToSavedPhotosAlbum(images, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            
        }
        
    }else {
        
        
        
    }
}

/** 图片保存成功后调用的方法 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    NSLog(@"保存图片");
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)uploadImagedata:(NSData *)imagedata
{
    
    NSString *uid = USERINFO[@"uid"];
    if(uid.length == 0 || [uid isEqualToString:@""] || uid == nil){
        //uid有误
        return;
    }
        NSString *pictureDataString = [imagedata base64EncodedStringWithOptions:0];
        NSLog(@"%@",pictureDataString);
        [HttpTool sendRequestWithUrl:@"http://we.liulongzhu.com/Service/WebServiceForApp.asmx" functionName:@"FileupIMG" paramNames:@[@"Uid",@"FileByteArray",@"strType"] paramValues:@[uid,pictureDataString,@".jpg"] success:^(NSData * data) {
            NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
            NSString * result = dic[@"soap:Body"][@"FileupIMGResponse"][@"FileupIMGResult"];
            if ([result isEqualToString:@"1"]) {
                [LiangTools showToastWithContent:@"上传头像失败"];
            }else if(result){
                [LiangTools showToastWithContent:@"上传头像成功"];
                NSMutableDictionary * userInfo = [NSMutableDictionary dictionaryWithDictionary:USERINFO];
                [userInfo setObject:result forKey:@"headimg"];
                [[NSUserDefaults standardUserDefaults]setObject:userInfo forKey:@"userInfoDic"];

                [self.txImage setImage:[UIImage imageWithData:imagedata]];
                [self.navigationController popViewControllerAnimated:YES];
            }
            NSLog(@"%@",dic);
        }failure:^(NSError *error) {
            [LiangTools showToastWithContent:@"上传头像失败"];
        }];
}


- (IBAction)XGMMbtn:(UIButton *)sender {
    
    NSLog(@"修改密码");
    XGMMViewController *bVC=[self.storyboard instantiateViewControllerWithIdentifier:@"XGMMViewController"];
    [self.navigationController pushViewController:bVC animated:YES];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"";
    backItem.image=[UIImage imageNamed:@""];
    self.navigationItem.backBarButtonItem=backItem;
    
}




- (IBAction)BCbtn:(UIButton *)sender {
    NSLog(@"保存");
    UIImage *image = self.txImage.image;
    
    if (self.imageBlock) {
        self.imageBlock(image);
    }

    
    
    
}
- (IBAction)TCbtn:(UIButton *)sender {
    NSLog(@"退出");
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    
    NSDictionary* dict = [defs dictionaryRepresentation];
    
    for(id key in dict) {
        
        [defs removeObjectForKey:key];
        
    }
    
    [defs synchronize];
    
    MYViewController *my=[[MYViewController alloc]init];
    
    my.name=@"登录/注册";
//
//    NSString* appDomain = [[NSBundle mainBundle]bundleIdentifier];
//    
//    [[NSUserDefaults standardUserDefaults]removePersistentDomainForName:appDomain];
//    
  
    
    [self.navigationController popViewControllerAnimated:YES];
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
