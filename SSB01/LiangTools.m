//
//  LiangTools.m
//  SSB01
//
//  Created by 王治亮 on 16/6/23.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "LiangTools.h"
#import "GDataXMLNode.h"

#define SOAPAction @"http://liulongzhu.com/"
#define URL_ROOT @"http://we.liulongzhu.com/Service/WebServiceForApp.asmx"

@implementation LiangTools

+(NSMutableURLRequest *)getRequestWithMethod:(NSString *)method forParameter:(NSDictionary *)param withManner:(NSString *)manner
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_ROOT]];
    
    NSMutableString *soapMessage = [NSMutableString new];
    
    
    [soapMessage appendFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     "<soap:Body>"];
    [soapMessage appendString:[NSString stringWithFormat:@"<%@ xmlns=\"%@\">",method,SOAPAction]];
    
    for (NSString *key in [param allKeys]) {
        NSString *str = [NSString stringWithFormat:@"<%@>%@</%@>",key,param[key],key];
        [soapMessage appendString:str];
    }
    [soapMessage appendFormat:@"</%@>"
    "</soap:Body>"
     "</soap:Envelope>",method];
    
    
    NSString *soapLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [request addValue: [NSString stringWithFormat:@"%@%@",SOAPAction,method] forHTTPHeaderField:@"SOAPAction"];
    [request addValue: soapLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:manner];
    
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+(BOOL)ba_isPhoneNumber:(NSString *)phoneNum
{
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNum];
}
/*!
 *  是否为电话号码【复杂写法】
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma 正则匹配用户密码 6 - 18 位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    if([password isEqualToString:@""])return NO;
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}

#pragma 正则匹配用户姓名, 20 位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName
{
    NSString *pattern = @"^[a-zA-Z一-龥]{ 1 , 20 }";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
    
}


#pragma 正则匹配用户身份证号 15 或 18 位
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    NSString *pattern = @"(^[ 0 - 9 ]{ 15 }$)|([ 0 - 9 ]{ 17 }([ 0 - 9 ]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

#pragma 正则匹员工号, 12 位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number
{
    NSString *pattern = @"^[ 0 - 9 ]{ 12 }";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:number];
    return isMatch;
    
}

#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url
{
    NSString *pattern = @"^[ 0 -9A-Za-z]{ 1 , 50 }";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:url];
    return isMatch;
    
    
}
+(NSDictionary *)getWebServiceXMLResult:(NSString *) content xpath:(NSString *)path
{
    content = [content stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    content = [content stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    if (![content hasPrefix:@"<?xml version"]) {
        return [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    }else{
        NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] init];
        content = [content stringByReplacingOccurrencesOfString:@"<" withString:@"<"];
        content = [content stringByReplacingOccurrencesOfString:@">" withString:@">"];
        content = [content stringByReplacingOccurrencesOfString:@"xmlns" withString:@"noNSxml"];
        NSError *docError = nil;
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:content options:0 error:&docError];
        if(!docError)
        {
            NSArray *children = nil;
            children = [document nodesForXPath:[NSString stringWithFormat:@"//%@",path] error:&docError];
            if(!docError)
            {
                if(children && [children count]>0)
                {
                    GDataXMLElement *rootElement = (GDataXMLElement *)[children objectAtIndex:0];
                    NSArray *nodearr = [rootElement children];
                    for (int i = 0; i<[nodearr count]; i++) {
                        GDataXMLElement *element = (GDataXMLElement *)[nodearr objectAtIndex:i];
                        [resultDict setObject:[element stringValue] forKey:[element name]];
                    }
                }
            }
        }
        return resultDict;
        //        if ([resultDict allKeys].count > 0) {
        //            NSData *data =[resultDict[@"text"] dataUsingEncoding:NSUTF8StringEncoding];
        //            NSError *error;
        //            resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        //            if (error !=nil ) {
        //                NSLog(@"%@",error);
        //            }
        //            // NSLog(@"connectionDidFinishLoading %@",jsons);
        //            return resultDict;
        //        }else{
        //            return resultDict;
        //        }
    }
    
    /*
     1、获取GDataXMLNode.h/m文件，将GDataXMLNode.h/m文件添加到工程中
     2、向工程中增加“libxml2.dylib”库
     3、在工程的“Build Settings”页中找到“Header Search Path”项，添加/usr/include/libxml2"到路径中
     4、添加“GDataXMLNode.h”文件到头文件中，如工程能编译通过，则说明GDataXMLNode添加成功
     */
    
}
/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
        
        
    }
    
    
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}



+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+(void)showToastWithContent:(NSString *)content{
    CLProgressLabel *progressLabel = [CLProgressLabel progressLabel];
    progressLabel.remindLabel = content;
    progressLabel.remindLabelHight = 100;
}
@end
