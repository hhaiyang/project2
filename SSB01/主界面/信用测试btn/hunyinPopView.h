//
//  hunyinPopView.h
//  SSB01
//
//  Created by momode on 16/6/20.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol hunyinPopViewDelegate <NSObject>

- (void)chooseButton2:(NSString *)title;

@end

@interface hunyinPopView : UIView
-(void)xiaoshi;
//**
//* 暂不支持滑动
//**/

/**
 *  初始化方法
 *
 *  @param superView 父视图
 *
 *  @return return value description
 */
- (instancetype)initWithSuperView2:(UIView *)superView;
/**
 *  初始化方法
 *
 *  @param superView 父视图
 *  @param items     按钮数组
 *
 *  @return return value description
 */
- (instancetype)initWithSuperView2:(UIView *)superView items2:(NSArray *)items;
/**
 *  弹出视图,再次点击消失
 */
- (void)showPopView2;
/**
 *  按钮数组
 */
@property (nonatomic, strong) NSArray *items2;
/**
 *  弹出视图的颜色(默认白色)
 */
@property (nonatomic, strong) UIColor *backColor2;
/**
 *  边框颜色(默认黑色)
 */
@property (nonatomic, strong) UIColor *PopBorderColor2;
/**
 *  代理
 */
@property (nonatomic, assign) id<hunyinPopViewDelegate>delegate;



@end
