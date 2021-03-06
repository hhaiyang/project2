//
//  guanxiyiPopView.m
//  SSB01
//
//  Created by momode on 16/6/20.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "guanxiyiPopView.h"

#define kWindow [[UIApplication sharedApplication].delegate window]
#define kButtonHeight 30
#define kFont [UIFont systemFontOfSize:12]


@implementation guanxiyiPopView
{
    NSArray *buttonItems;
    CGFloat popViewX;
    CGFloat popViewY;
    BOOL isShow;
}

- (instancetype)initWithSuperView6:(UIView *)superView
{
    if (self = [super init]) {
        [self loadUI:superView];
    }
    return self;
}

- (instancetype)initWithSuperView6:(UIView *)superView items6:(NSArray *)items
{
    if (self = [super init]) {
        buttonItems = [NSArray arrayWithArray:items];
        [self loadUI:superView];
    }
    return self;
}
/**
 *  设置按钮数组
 *
 *  @param items 数组按钮
 */
- (void)setItems:(NSArray *)items
{
    _items6 = items;
    buttonItems = [NSArray arrayWithArray:items];
}
/**
 *  设置弹出视图的背景色
 *
 *  @param backColor 背景色,默认白色
 */
- (void)setBackColor:(UIColor *)backColor
{
    _backColor6= backColor;
    self.backColor = backColor;
}
/**
 *  弹出视图边框颜色
 *
 *  @param PopBorderColor 默认黑色
 */
- (void)setPopBorderColor:(UIColor *)PopBorderColor
{
    _PopBorderColor6 = PopBorderColor;
    self.layer.borderColor = PopBorderColor.CGColor;
}
/**
 *  显示弹出视图,再次点击消失
 */
- (void)showPopView6
{
    if (!isShow) {
        [kWindow addSubview:self];
        [UIView animateWithDuration:0.333 animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, buttonItems.count * kButtonHeight);
        }];
    }else{
        [UIView animateWithDuration:0.333 animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    isShow = !isShow;
}
-(void)xiaoshi
{
    [UIView animateWithDuration:0.333 animations:^{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
//按钮点击事件
- (void)buttonClick:(UIButton *)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(chooseButton6:)]) {
        [self.delegate chooseButton6:sender.titleLabel.text];
        [self showPopView6];
    }
}
/**
 *  布局
 *
 *  @param superView superView description
 */
- (void)loadUI:(UIView *)superView
{
    isShow = NO;
    popViewX = superView.frame.origin.x;
    popViewY = superView.frame.origin.y+10;
    
    UIView *sup = superView;
    while ([sup.superview isKindOfClass:[UIView class]]) {
        popViewX += sup.superview.frame.origin.x;
        popViewY += sup.superview.frame.origin.y;
        
        sup = sup.superview;
    }
    self.frame = CGRectMake(popViewX,  200, superView.frame.size.width, 0);
    [self setButton];
    self.layer.borderWidth = 0;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
}
/**
 *  设置按钮
 */
- (void)setButton
{
    for (int i = 0; i < buttonItems.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonItems[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = kFont;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.frame = CGRectMake(0, kButtonHeight * i, self.frame.size.width, kButtonHeight);
        [self addSubview:button];
    }
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */





@end
