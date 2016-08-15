//
//  CPCell.h
//  SSB01
//
//  Created by momode on 16/7/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPZDModel.h"

#import "SWTableViewCell.h"

@interface CPCell : SWTableViewCell

@property (nonatomic, strong) CPZDModel *model;

- (void)initWithModel:(CPZDModel *)model;

@end
