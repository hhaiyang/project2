//
//  CPCell.m
//  SSB01
//
//  Created by momode on 16/7/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "CPCell.h"
@interface CPCell ()
@property (nonatomic,strong)UILabel *beizhu;
@property (nonatomic,strong)UIImageView *ge;
@property (nonatomic,strong)UILabel *huankuanqi;
@property (nonatomic,strong)UILabel *shoufu;
@end
@implementation CPCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    _beizhu=[UILabel new];
    [self.contentView addSubview:_beizhu];
    UIFont *beizhufont=[UIFont systemFontOfSize:15];
    UIColor *yanse=kRGBColor(180, 180, 180, 1.0);
    UIFont *qixianfont=[UIFont systemFontOfSize:13];
    UIFont *shoufufont=[UIFont systemFontOfSize:16];
    _beizhu.font=beizhufont;
    _beizhu.textColor=yanse;
    
    _huankuanqi=[UILabel new];
    _huankuanqi.font=qixianfont;
    _huankuanqi.textColor=yanse;
    
    _shoufu=[UILabel new];
    _shoufu.font=shoufufont;
    _shoufu.textColor=yanse;
    
    _ge=[UIImageView new];
    [_ge setImage:[UIImage imageNamed:@"xiaobang"]];
    [self.contentView addSubview:_huankuanqi];
    [self.contentView addSubview:_shoufu];
    [self.contentView addSubview:_ge];
    [_beizhu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(15);
    }];
    [_ge mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(10);
        make.left.equalTo(_beizhu.mas_right).mas_equalTo(10);
        
    }];
    [_huankuanqi mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(12);
        make.left.equalTo(_ge.mas_left).mas_equalTo(10);
        
    }];
    [_shoufu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(12);
        make.right.mas_equalTo(-15);
    }];
}
- (void)initWithModel:(CPZDModel *)model{
    _model = model;
    [_beizhu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(15);
    }];
    [_ge mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(10);
        make.left.equalTo(_beizhu.mas_right).mas_equalTo(10);
    }];
    [_huankuanqi mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(12);
        make.left.equalTo(_ge.mas_left).mas_equalTo(10);
    }];
    [_shoufu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(12);
        make.right.mas_equalTo(-15);
    }];
    _shoufu.text=model.ZDFistPay;
    _huankuanqi.text=model.ZDMdate;
    _beizhu.text=model.ZDIntruduction;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
