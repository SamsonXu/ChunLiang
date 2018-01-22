//
//  HttpManager.h
//  ChunLiang
//
//  Created by admin on 2018/1/22.
//  Copyright © 2018年 ChunLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(id responseObject);
typedef void (^failBlock)(void);

@interface HttpManager : NSObject

@property (nonatomic, copy) successBlock sucBlock;
@property (nonatomic, copy) failBlock failBlock;
+ (HttpManager *)share;

//网络请求
+ (void)postWithUrl:(NSString *)url parameters:(id)parameters sucBlock:(successBlock)sucBlock fail:(failBlock)failBlock;

//base64加密
+ (NSString *)base64StringWithContent:(NSString *)content key:(NSString *)key;

//MD5加密
+ (NSString*)md532BitLower:(NSString *)MD5;

@end
