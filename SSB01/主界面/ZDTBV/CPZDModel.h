//
//  CPZDModel.h
//  SSB01
//
//  Created by ChenZhiCheng on 16/7/17.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CPZDModel : NSObject
@property (nonatomic, strong) NSString *ZDUid;//账单id
@property (nonatomic, strong) NSString *ZDProductName;//账单产品名称
@property (nonatomic, strong) NSString *ZDProductImage;//账单产品对应图片
@property (nonatomic, strong) NSString *ZDAmountPer;//账单月供
@property (nonatomic, strong) NSString *ZDLimitDate;//账单还款日
@property (nonatomic, strong) NSString *ZDMdate;//账单还款日期
@property (nonatomic, strong) NSString *ZDPeriods;//账单总期数
@property (nonatomic, strong) NSString *ZDPeriodNow;//账单已还期数
@property (nonatomic, strong) NSString *ZDFistPay;//账单首付
@property (nonatomic, strong) NSString *ZDIntruduction;//账单备注
@property (nonatomic, strong) NSString *ZDNowToLimitDate;//距离还款日天数
@property (nonatomic, strong) NSString *ZDTitle;//账单备注
@property (nonatomic, strong) NSString *ZDPeriodsTitle;//账单备注

@property (nonatomic, assign) BOOL isExpand;//是否展开
@property (nonatomic, assign) BOOL isYiHuan;//是否已还款
@property (nonatomic, assign) BOOL isInOneMonth;//是否一月之内需要还款
@property (nonatomic, assign) CGFloat headHeight;
@property(nonatomic, assign) CGFloat cellHeight;

+ (CPZDModel *)zdmodelWithDict:(NSDictionary *)dict;
@end
