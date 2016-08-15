//
//  DateViewController.m
//  SSB01
//
//  Created by 郑文青 on 16/7/8.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dateView;
@property(nonatomic,copy)dateBlock myBlock;
@end

@implementation DateViewController
- (IBAction)clickOKBtn:(id)sender
{
    NSDate *date = [self.dateView date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"YYYYMMdd";
    NSString *dateStr = [formatter stringFromDate:date];
    
    NSLog(@"date:%@",dateStr);
   self.myBlock(dateStr);

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)getStrBlock:(dateBlock)dateBlock
{
    self.myBlock = dateBlock;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
  self.title = @"请选择借款时间";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
