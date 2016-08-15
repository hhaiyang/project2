//
//  guangxierPopView.h
//  SSB01
//
//  Created by momode on 16/6/20.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol guangxierPopViewDelegate <NSObject>

- (void)chooseButton7:(NSString *)title;

@end



@interface guangxierPopView : UIView

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
- (instancetype)initWithSuperView7:(UIView *)superView;
/**
 *  初始化方法
 *
 *  @param superView 父视图
 *  @param items     按钮数组
 *
 *  @return return value description
 */
- (instancetype)initWithSuperView7:(UIView *)superView items7:(NSArray *)items;
/**
 *  弹出视图,再次点击消失
 */
- (void)showPopView7;
/**
 *  按钮数组
 */
@property (nonatomic, strong) NSArray *items7;
/**
 *  弹出视图的颜色(默认白色)
 */
@property (nonatomic, strong) UIColor *backColor7;
/**
 *  边框颜色(默认黑色)
 */
@property (nonatomic, strong) UIColor *PopBorderColor7;
/**
 *  代理
 */
@property (nonatomic, assign) id<guangxierPopViewDelegate>delegate;












@end
