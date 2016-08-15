//
//  DLZCViewController.h
//  SSB01
//
//  Created by momode on 16/6/13.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef void (^GetUserName)(NSString *name);


@interface DLZCViewController : UIViewController

@property (nonatomic,copy)GetUserName block;





@end
