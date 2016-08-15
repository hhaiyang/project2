//
//  CPZDModel.m
//  SSB01
//
//  Created by ChenZhiCheng on 16/7/17.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "CPZDModel.h"

@implementation CPZDModel


+ (CPZDModel *)zdmodelWithDict:(NSDictionary *)dict
{
    if (dict == nil) {
        return nil;
    }
    CPZDModel *model = [[CPZDModel alloc]init];
    model.ZDUid = dict[@"uid"];
    model.ZDProductName = dict[@"ProductName"];
    model.ZDAmountPer = dict[@"AmountPer"];
    model.ZDLimitDate = dict[@"LimitDate"];
    model.ZDMdate = dict[@"mdate"];
    model.ZDPeriods = dict[@"periods"];
    model.ZDPeriodNow = dict[@"PeriodNow"];
    model.ZDFistPay = dict[@"fistpay"];
    model.ZDIntruduction = dict[@"Intruduction"];
    
    //获取距离多少天还款
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *fromDate;
    NSDate *toDate;
    NSDate * now = [NSDate date];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:model.ZDLimitDate]];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:now];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    model.ZDNowToLimitDate = [NSString stringWithFormat:@"%ld",-dayComponents.day];
    //判断是否30天内需要还款
    model.isInOneMonth = -dayComponents.day <= 30;
    
    //cell显示的title
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponent = [calendar components:NSCalendarUnitMonth fromDate:now];
    NSInteger currentMonth = [dateComponent month];
    model.ZDTitle = [NSString stringWithFormat:@"%@%ld月账单",model.ZDProductName,currentMonth];
    
    //还款期数
    model.ZDPeriodsTitle = [NSString stringWithFormat:@"%@/%@期",model.ZDPeriodNow,model.ZDPeriods];
    
    //图片这里根据产品名称进行处理一下
    //你可以使用产品名称给图片命名，或者在后面加上某种特殊的字段
    //比如 产品名是：豆豆钱
    //那么产品对应的图片，你可以直接用 豆豆钱 命名或者用类似 豆豆钱_image 这种
    model.ZDProductImage = [NSString stringWithFormat:@"%@_image",model.ZDProductName];
//    if (model.isExpand==YES) {
//        model
//    }
    
    
    
    model.isExpand = NO;
    model.headHeight = 80.0;
    model.cellHeight = 40.0f;
    return model;
}
@end
