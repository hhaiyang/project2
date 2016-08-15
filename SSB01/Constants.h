//
//  Constants.h
//  property
//
//  Created by 郑文青 on 16/4/28.
//  Copyright © 2016年 zhengwenqing’s mac. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define REGION_HEADER_Y 64
#define REGION_HEADER_HEIGHT 50

/** RGB 颜色宏    */

#define kRGBColor(R,G,B,Alpha) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:Alpha]
#define IOS8                                    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)



#define STUDENT_STATE_NEWADD                @"STUDENT_STATE_NEWADD"
#define STUDENT_STATE_SUBJECT_ONE           @"SUBJECT_ONE"
#define STUDENT_STATE_SUBJECT_TWO           @"SUBJECT_TWO"
#define STUDENT_STATE_SUBJECT_THREE         @"SUBJECT_THREE"
#define STUDENT_STATE_SUBJECT_FOUR          @"SUBJECT_FOUR"
#define STUDENT_STATE_GRADUATE              @"GRADUATE"
#define SubjectTypeArray                    @[STUDENT_STATE_NEWADD,STUDENT_STATE_SUBJECT_ONE,       STUDENT_STATE_SUBJECT_TWO,STUDENT_STATE_SUBJECT_THREE,STUDENT_STATE_SUBJECT_FOUR,STUDENT_STATE_GRADUATE]

#define THEME_COLOR [UIColor colorWithRed:236/255.0 green:235/255.0 blue:240/255.0 alpha:1]
#define USERINFO [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfoDic"]
#import "Masonry.h"
#import "SWTableViewCell.h"
#import "NSString+Helpers.h"

#import "SDAutoLayout.h"



#endif /* Constants_h */
