//
//  TXViewController.h
//  SSB01
//
//  Created by momode on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackImageBlock)(UIImage *image);

@interface TXViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *txImage;

@property (weak, nonatomic) IBOutlet UILabel *TXusername;

@property(nonatomic,retain) NSString *firstValue ;

@property (nonatomic , copy) BackImageBlock imageBlock;


@end
