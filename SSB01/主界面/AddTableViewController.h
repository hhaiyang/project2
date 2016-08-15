//
//  AddTableViewController.h
//  SSB01
//
//  Created by momode on 16/7/8.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>
//代理
@protocol AddDelegate <NSObject>

-(void)getSelectedString:(NSString *)backStr;

@end


@interface AddTableViewController : UITableViewController

/** 属性 */
@property (nonatomic,assign)id<AddDelegate> delegate;


@end
