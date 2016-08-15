

//
//  HttpTool.m
//  SSB01
//
//  Created by tarena on 16/6/14.
//  Copyright © 2016年 momode. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool
+(void)sendRequestWithUrl:(NSString *)urlString functionName:(NSString*)functionName paramNames:(NSArray *)paramNames paramValues:(NSArray *)paramValues success:(void (^)(NSData * data))success failure:(void (^)(NSError * error))failure{
    NSMutableString *soapMessage =[NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                                   "<soap:Body>"
                                   "<%@ xmlns=\"http://liulongzhu.com/\">",functionName];
    for (int i = 0; i < paramValues.count; i ++) {
        id value = paramValues[i];
        if ([value isKindOfClass:[NSNumber class]]) {
            int intvalue = [(NSNumber *)value intValue];
            [soapMessage appendFormat:@"<%@>%d</%@>",paramNames[i],intvalue,paramNames[i]];
        }else{
            [soapMessage appendFormat:@"<%@>%@</%@>",paramNames[i],paramValues[i],paramNames[i]];
        }
        
        //                            "<TypeName>%@</TypeName>""
    }
    [soapMessage appendFormat:@"</%@></soap:Body></soap:Envelope>",functionName];
    //    "</Daohang>"
    //    "</soap:Body>"
    //    "</soap:Envelope>";
    //    NSString *soapMessage =[NSString stringWithFormat:
    //                            @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    //                            "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    //                            "<soap:Body>"
    //                            "<Daohang xmlns=\"http://tempuri.org/\">"
    //                            "<AppName>%@</AppName>"
    //                            "<TypeName>%@</TypeName>"
    //                            "</Daohang>"
    //                            "</soap:Body>"
    //                            "</soap:Envelope>", @"",@""
    //                            ];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if(error == nil){
                                              
                                              
                                              NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                              
                                              // num = 2
                                              NSLog(@"%@", str);
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  success(data);
                                              });
                                              
                                          }else{
                                              NSLog(@"请求失败");
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  failure(error);
                                              });
                                          }
                                          //                                          NSDictionary * dic = [[XMLDictionaryParser sharedInstance] dictionaryWithData:data];
                                          //                                          NSLog(@"%@", dic);
                                      }];
    [dataTask resume];
}
@end
