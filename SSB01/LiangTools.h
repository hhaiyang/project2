//
//  LiangTools.h
//  SSB01
//
//  Created by 王治亮 on 16/6/23.
//  Copyright © 2016年 momode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CLProgressLabel.h"
@interface LiangTools : NSObject
/**
 *  提示语
 *
 *  @param content 提示内容
 */
+(void)showToastWithContent:(NSString *)content;
/**
 *  获取SOAP1.1 Request
 *
 *  @param method 方法名
 *  @param param  参数字典 参数名:参数值
 *  @param manner 请求方式（POST 、 GET）
 *
 *  @return NSMutableURLRequest
 */
+(NSMutableURLRequest *)getRequestWithMethod:(NSString *)method forParameter:(NSDictionary *)param withManner:(NSString *)manner;

/**
 *  解析xml的指定节点
 *
 *  @param content XML
 *  @param path    节点名
 *
 *  @return 字典，root：text
 */
+(NSDictionary *)getWebServiceXMLResult:(NSString *) content xpath:(NSString *)path;
/*!
 *  是否为电话号码【简单写法】
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+(BOOL)ba_isPhoneNumber:(NSString *)phoneNum;
/*!
 *  是否为电话号码【复杂写法】
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isMobileNumber:(NSString *)mobileNum;
/**
 *  是否是6-18位包含字母数字的密码
 *
 *  @param password 密码
 *
 *  @return bool
 */
+ (BOOL)checkPassword:(NSString *) password;
/**
 *  json转字典
 *
 *  @param jsonString jsonString description
 *
 *  @return return value description
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 *  字典转json字符串
 *
 *  @param dic dic description
 *
 *  @return return value description
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
@end
