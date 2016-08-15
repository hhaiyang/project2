//
//  CPHeaderView.m
//  SSB01
//
//  Created by momode on 16/7/12.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "CPHeaderView.h"


CGFloat headerViewPadding=1.0f;

@interface CPHeaderView  ()

@property (nonatomic,strong)UILabel *titlelabel;

@property (nonatomic,strong)UILabel *totalCPLabel;
@property (nonatomic,strong)UILabel *yuefu;

@property (nonatomic,strong)UILabel *yuefubiao;
@property (nonatomic,strong)UILabel *riqi;

@property (nonatomic,strong)UILabel *riqibiao;

@property (nonatomic,strong)UIImageView *huankuan;

@end

@implementation CPHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor whiteColor];
        [self setupView];
        
        
        
    }
    return self;
}


-(void)setupView
{
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:lineView];
    lineView.backgroundColor = THEME_COLOR;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(0.5f);
    }];
    
    self.arrowImageView = [UIImageView new];
    [self addSubview:self.arrowImageView];
    
    _titlelabel = [UILabel new];
    [self addSubview:_titlelabel];
    
    _totalCPLabel = [UILabel new];
    [self addSubview:_totalCPLabel];
    
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(20);
        //为了适配屏幕 和button2 的宽度相等
        make.width.mas_equalTo(20);
//        make.centerY.equalTo(self);
    }];
    
    UIFont *font = [UIFont systemFontOfSize:9];
    UIColor *color = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0  ];
    self.titlelabel.font = font;
    self.titlelabel.textColor = color;
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arrowImageView.mas_right).mas_equalTo(15);
        make.height.mas_equalTo(font.lineHeight);
//        make.centerY.equalTo(self);
        make.top.mas_equalTo(10);
    }];
    
    
    UIFont *totalFont = [UIFont systemFontOfSize:8];
    UIColor *totalColor = [UIColor grayColor];
    _totalCPLabel.font = totalFont;
    _totalCPLabel.textColor = totalColor;
    _totalCPLabel.textAlignment = NSTextAlignmentRight;
    [_totalCPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-headerViewPadding);
        make.height.mas_equalTo(totalFont.lineHeight);
        make.centerY.equalTo(self);
    }];
    
    
    _yuefu = [UILabel new];
    [self addSubview:_yuefu];
    _yuefu.text=@"0";
    UIFont *yufuFont=[UIFont systemFontOfSize:16];
    _yuefu.font=yufuFont;
    _yuefu.textColor=color;
    [_yuefu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(_arrowImageView.mas_bottom).mas_equalTo(10);
        make.height.mas_equalTo(yufuFont.lineHeight);
        
    }];

    _yuefubiao = [UILabel new];
    [self addSubview:_yuefubiao];

    _yuefubiao.text=@"应还金额(元)";
    UIFont *yufubiaoFont=[UIFont systemFontOfSize:9];
    _yuefubiao.font=yufubiaoFont;
    _yuefubiao.textColor=kRGBColor(180,180,180,1.0);
    [_yuefubiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(_yuefu.mas_bottom).mas_equalTo(7);
        make.height.mas_equalTo(yufubiaoFont.lineHeight);
        
    }];
    
    _riqi = [UILabel new];
    [self addSubview:_riqi];
    
    _riqi.text=@"0";
    
    _riqi.font=yufuFont;
    _riqi.textColor=color;
    [_riqi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(180);
        make.top.mas_equalTo(_yuefu);
        make.height.mas_equalTo(yufuFont.lineHeight);
        
    }];

    _riqibiao=[UILabel new];
    [self addSubview:_riqibiao];
    
    _riqibiao.text=@"距离还款日(天)";
    
    _riqibiao.font=yufubiaoFont;
    _riqibiao.textColor=kRGBColor(180,180,180,1.0);
    [_riqibiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(160);
        make.top.equalTo(_riqi.mas_bottom).mas_equalTo(7);
        make.height.mas_equalTo(yufubiaoFont.lineHeight);
        
    }];

    
    _huankuan=[UIImageView new];
    [self addSubview:_huankuan];
    
    [_huankuan setImage:[UIImage imageNamed:@"立即还款k"]];

    
    [_huankuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
         make.top.mas_equalTo(_yuefu);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(60);
    }];
    
    
    [_huankuan setUserInteractionEnabled:YES];
    [_huankuan addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLJHKBtn)]];
    
}

-(void)clickLJHKBtn
{
    NSLog(@"点中了立即还款按钮");
    if (self.delegate && [self.delegate respondsToSelector:@selector(paynowWithModel:)]) {
        [self.delegate paynowWithModel:_model];
    }
//    NSLog(@"%@",self.chuanname);
//    LJHKTViewController *ljh=[[LJHKTViewController alloc]init];
//    ljh.jsname=self.chuanname;
//    ljh.jsmoney=self.chuanmoney;
//    ljh.jstu=self.chuantu;
//    [self.navigationController pushViewController:ljh animated:YES];
//

    
}


- (void)initWithModel:(CPZDModel *)model{
    _model = model;
    self.titlelabel.text = model.ZDProductName;
    self.arrowImageView.image = [UIImage imageNamed:model.ZDProductImage];
    _riqi.text = model.ZDNowToLimitDate;
//    NSString *totalMoney = [NSString stringWithFormat:@"%ld",[model.ZDAmountPer integerValue] * [model.ZDPeriods integerValue]];
    _yuefu.text = model.ZDAmountPer;
    
//    _arrowImageView图片
//    _titlelabel 标题
//    _yuefu 应还金额
//    _riqi 距离还款日（天）
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
