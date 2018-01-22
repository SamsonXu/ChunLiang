//
//  HttpManager.m
//  ChunLiang
//
//  Created by admin on 2018/1/22.
//  Copyright © 2018年 ChunLiang. All rights reserved.
//

#import "HttpManager.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HttpManager

+ (HttpManager *)share{
    
    static HttpManager *tool;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        if (!tool) {
            tool = [[HttpManager alloc]init];
        }
    });

    return tool;
}

+ (void)postWithUrl:(NSString *)url parameters:(id)parameters sucBlock:(successBlock)sucBlock fail:(failBlock)failBlock{
    
    NSString *key = KChunLiangKey;
    key = [self md532BitLower:key];
    
    NSString *prefixStr = KURL(@"");
    NSString *tempUrl = [url stringByReplacingOccurrencesOfString:prefixStr withString:@""];
    
    NSString *timeString = [MyControl getTimeString];
    NSString *token;
    NSString *userId = @"";
   
    if ([[parameters allKeys] containsObject:@"userId"]) {
        userId = parameters[@"userId"];
    }else if ([[parameters allKeys] containsObject:@"user_id"]){
        userId = parameters[@"user_id"];
    }else if ([[parameters allKeys] containsObject:@"uid"]){
        userId = parameters[@"uid"];
    }
    
    if (userId.length > 0) {
        token = [NSString stringWithFormat:@"%@%@%@%@",tempUrl,timeString,key,userId];
        token = [self md532BitLower:token];
    }else{
        token = [NSString stringWithFormat:@"%@%@%@",tempUrl,timeString,key];
        token = [self md532BitLower:token];
    }

    NSMutableDictionary *mudic = [[NSMutableDictionary alloc]init];
    [mudic setValuesForKeysWithDictionary:parameters];
    [mudic setObject:token forKey:@"token"];
    
    NSString *tempVersion = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *version = [tempVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:version forHTTPHeaderField:@"version"];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"device"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
   
    
    if (KIOS_VERSION >= 9.0) {
        manager.securityPolicy.allowInvalidCertificates = YES;
        [manager.securityPolicy setValidatesDomainName:NO];
    }
    
    [manager POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        if (sucBlock) {
            sucBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error:%@",error.localizedDescription);
    }];
    
}

+ (NSString *)base64StringWithContent:(NSString *)content key:(NSString *)key{
    
    if (content.length == 0 || key.length == 0) {
        return false;
    }
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSString *txt = [data base64EncodedStringWithOptions:0];
    NSString *randKey = [self md532BitLower:key];
    
    NSString *even = [[NSString alloc]init];
    NSString *odd = [[NSString alloc]init];
    for (int i = 0; i < randKey.length; i++) {
        
        if (i%2 == 0) {
            
            even = [NSString stringWithFormat:@"%@%@",even,[randKey substringWithRange:NSMakeRange(i, 1)]];
        }else{
            
            odd = [NSString stringWithFormat:@"%@%@",odd,[randKey substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    
    NSInteger rand = arc4random()%2;
    if (rand == 0) {
        rand = 2;
    }
    
    NSString *str = [[NSString alloc]init];
    for (int i = 0; i < rand; i++) {
        CGFloat fen = floor(txt.length/rand);
        
        NSString *my = [[NSString alloc]init];
        
        if (i == rand-1) {
            my = [txt substringFromIndex:i*fen];
        }else{
            my = [txt substringWithRange:NSMakeRange(i*fen, fen)];
        }
        NSInteger index = arc4random()%my.length;
        
        if (i%2 == 0) {
            str = [NSString stringWithFormat:@"%@%@%@%@",str,[my substringWithRange:NSMakeRange(0, index)],even,[my substringFromIndex:index]];
        }else{
            str = [NSString stringWithFormat:@"%@%@%@%@",str,[my substringWithRange:NSMakeRange(0, index)],odd,[my substringFromIndex:index]];
        }
    }
    
    NSData *resultData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *resultStr = [resultData base64EncodedStringWithOptions:0];
    return resultStr;
}

+ (NSString*)md532BitLower:(NSString *)MD5

{
    
    const char *cStr = [MD5 UTF8String];
    
    unsigned char result[16];
    
    
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    
    CC_MD5( cStr,[num intValue], result );
    
    
    
    return [[NSString stringWithFormat:
             
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             
             result[0], result[1], result[2], result[3],
             
             result[4], result[5], result[6], result[7],
             
             result[8], result[9], result[10], result[11],
             
             result[12], result[13], result[14], result[15]
             
             ] lowercaseString];
    
}

@end
