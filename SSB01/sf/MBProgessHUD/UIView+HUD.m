//
//  UIView+HUD.m
//  MVVM模式练习
//
//  Created by zhengwenqing’s mac on 16/4/2.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import "UIView+HUD.h"
#import "MBProgressHUD.h"
#define kAfterDelayTimeDuration 1.5

#define kTimeoutDuration 30

@implementation UIView (HUD)
-(void)showWarning:(NSString *)word
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = word;
        
        [hud hide:YES afterDelay:kAfterDelayTimeDuration];
    });
    
 
}
-(void)showBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        
        [[MBProgressHUD showHUDAddedTo:self animated:YES]hide:YES afterDelay:kTimeoutDuration];
        
    });
}
-(void)hiddenBusyHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
}
@end
