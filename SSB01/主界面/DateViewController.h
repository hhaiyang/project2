//
//  DateViewController.h
//  SSB01
//
//  Created by 郑文青 on 16/7/8.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>

//block
typedef void(^dateBlock)(NSString *dateStr);

@interface DateViewController : UIViewController
//定义finishBlock方法

-(void)getStrBlock:(dateBlock)dateBlock;

@end
