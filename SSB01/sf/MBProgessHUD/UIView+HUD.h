//
//  UIView+HUD.h
//  MVVM模式练习
//
//  Created by zhengwenqing’s mac on 16/4/2.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
-(void)showWarning:(NSString *)word;
-(void)showBusyHUD;
-(void)hiddenBusyHUD;

@end
