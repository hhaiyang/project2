//
//  JSDKCell.m
//  SSB01
//
//  Created by 郑文青 on 16/6/2.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "JSDKCell.h"

@implementation JSDKCell

- (void)setFrame:(CGRect)frame {
    frame.origin.x +=
    10;
    
    frame.size.width -=
    2 * 10;
    [super setFrame:frame];
}

- (void)awakeFromNib {
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = kRGBColor(214, 215, 220, 1.0).CGColor;
    self.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
