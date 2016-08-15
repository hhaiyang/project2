
//
//  ZDCell.m
//  SSB01
//
//  Created by tarena on 16/7/25.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "ZDCell.h"
@interface ZDCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *accountL;
@property (weak, nonatomic) IBOutlet UILabel *daysL;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UILabel *periodsL;
@property (weak, nonatomic) IBOutlet UIImageView *yihuankuanImageView;
@property (weak, nonatomic) IBOutlet UILabel *bottomAccountL;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *zhangdanmingxi;

@end
@implementation ZDCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)buttonClick:(id)sender {
    if (self.clickAction) {
        self.clickAction(self.model);
    }
}
-(void)setModel:(CPZDModel *)model{
    _model = model;
    _titleL.text = model.ZDTitle;
    _accountL.text = model.ZDAmountPer;
    _productImageView.image = [UIImage imageNamed:model.ZDProductImage];
    _daysL.text = model.ZDNowToLimitDate;
    _periodsL.text = model.ZDPeriodsTitle;
    _bottomAccountL.text =  [NSString stringWithFormat:@"¥%@",model.ZDAmountPer];
    _zhangdanmingxi.text=model.ZDIntruduction;
    if (model.isYiHuan) {
        _rightButton.hidden = YES;
        _yihuankuanImageView.hidden = NO;
    }else{
        _rightButton.hidden = NO;
        _yihuankuanImageView.hidden = YES;
    }
    if (model.isExpand) {
        _bottomView.hidden = NO;
        self.contentView.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
        
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"白框_03"] forState:UIControlStateNormal];
    
    }else{
        _bottomView.hidden = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
