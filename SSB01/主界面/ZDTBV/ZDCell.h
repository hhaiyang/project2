//
//  ZDCell.h
//  SSB01
//
//  Created by tarena on 16/7/25.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPZDModel.h"
typedef void (^ClickAction)(CPZDModel * model);
@interface ZDCell : UITableViewCell
@property (nonatomic,strong)CPZDModel * model;
@property (nonatomic,strong)ClickAction clickAction;
@end
