//
//  XYPopView.h
//  pop
//
//  Created by 徐洋 on 16/5/3.
//  Copyright © 2016年 徐洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYPopViewDelegate <NSObject>

- (void)chooseButton:(NSString *)title;

@end

@interface XYPopView : UIView
/**
 * 暂不支持滑动
**/

/**
 *  初始化方法
 *
 *  @param superView 父视图
 *
 *  @return return value description
 */
- (instancetype)initWithSuperView:(UIView *)superView;
/**
 *  初始化方法
 *
 *  @param superView 父视图
 *  @param items     按钮数组
 *
 *  @return return value description
 */
- (instancetype)initWithSuperView:(UIView *)superView items:(NSArray *)items;
/**
 *  弹出视图,再次点击消失
 */
- (void)showPopView;
/**
 *  按钮数组
 */
-(void)xiaoshi;
@property (nonatomic, strong) NSArray *items;
/**
 *  弹出视图的颜色(默认白色)
 */
@property (nonatomic, strong) UIColor *backColor;
/**
 *  边框颜色(默认黑色)
 */
@property (nonatomic, strong) UIColor *PopBorderColor;
/**
 *  代理
 */
@property (nonatomic, assign) id<XYPopViewDelegate>delegate;

@end
