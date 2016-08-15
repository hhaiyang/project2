//
//  XYKTableViewCell.m
//  SSB01
//
//  Created by momode on 16/7/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "XYKTableViewCell.h"

@implementation XYKTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setup
{
    self.chanpinimage=[UIImageView new];
    self.xiahuaxian=[UIView new];
    self.xiahuaxian.backgroundColor=kRGBColor(220, 220, 220, 1.0);
//    [self.xiahuaxian setFrame:CGRectMake(0, 0, self.viewController.view.frame.size.width-60, 1)];
    self.biaoti=[UILabel new];
    self.biaoti.text=@"这里lable1";
    self.biaoti.font=[UIFont systemFontOfSize:16];
    self.biaoti.textColor=kRGBColor(50, 50, 50, 1.0);
    
    self.neirong=[UILabel new];
    self.neirong.text=@"这里lable2";
    self.neirong.font=[UIFont systemFontOfSize:13];
    self.neirong.textColor=kRGBColor(100, 100, 100, 1.0);

    self.jiantou=[UIImageView new];
    self.jiantou.image=[UIImage imageNamed:@"jiantou"];
    [self.contentView sd_addSubviews:@[self.chanpinimage,self.biaoti,self.neirong,self.jiantou,self.xiahuaxian]];
    UIView * contentView=self.contentView;
    self.xiahuaxian.sd_layout.leftSpaceToView(contentView,30).bottomSpaceToView(contentView,0).rightSpaceToView(contentView,30).heightIs(1);
    self.chanpinimage.sd_layout.leftSpaceToView(contentView,20).topSpaceToView(contentView,10).bottomSpaceToView(contentView,10).widthIs(40);
    self.biaoti.sd_layout.leftSpaceToView(self.chanpinimage,20).topEqualToView(self.chanpinimage).rightSpaceToView(contentView,10).heightIs(17);
    self.neirong.sd_layout.leftEqualToView(self.biaoti).bottomEqualToView(self.chanpinimage).rightEqualToView(self.biaoti).heightIs(13);
    self.jiantou.sd_layout.rightSpaceToView(contentView,15).topSpaceToView(contentView,22).bottomSpaceToView(contentView,22).widthIs(10);
}




@end
