//
//  CPHeaderView.h
//  SSB01
//
//  Created by momode on 16/7/12.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPZDModel.h"
@protocol CpHeaderViewDelegate<NSObject>
- (void)paynowWithModel:(CPZDModel *)model;
- (void)hadPayWithModel:(CPZDModel *)model;
@end

@interface CPHeaderView : UIView
@property (nonatomic,strong)UIImageView *arrowImageView;
@property (nonatomic, weak) id<CpHeaderViewDelegate> delegate;
@property (nonatomic,strong)CPZDModel *model;

-(void)initWithModel:(CPZDModel *)model;
@end
