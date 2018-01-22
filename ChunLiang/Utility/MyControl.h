//
//  MyLabel.h
//  MyFamily
//
//  Created by qianfeng on 16/3/17.
//  Copyright (c) 2016年 Motion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyControl : NSObject

//导航栏左边按钮
+ (UIButton *)createNavLeftBtn;

//Label不含坐标
+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num;

//Label包含文字、坐标、字体
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram fontOfSize:(CGFloat)fontOfSize;

//Label包含文字、坐标、字体、行数
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram  fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num;

//Label包含文字、坐标、字体、颜色、行数
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num;

//粗体Label包含文字、坐标、字体
+ (UILabel *)boldLabelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize;

//imageView包含坐标、图片名
+ (UIImageView *)imageViewWithFram:(CGRect)fram imageName:(NSString *)imageName;

//imageView包含坐标、地址
+ (UIImageView *)imageViewWithFram:(CGRect)fram url:(NSString *)imageUrl;

//button包含坐标、文字、图片
+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName;

//button包含坐标、文字、图片、下标
+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag;

//分割字符串获取答案
+ (NSArray *)getAnswerWithString:(NSString *)str;

//根据字体和内容设置大小
+ (CGSize)getSizeWithString:(NSString *)str font:(UIFont *)font size:(CGSize)size;

//设置label行距
+ (UILabel *)setLineSpaceWithLabel:(UILabel *)label;

//效验手机号
+ (BOOL)isValueToPhoneNumber:(NSString *)str;

//效验密码
+ (BOOL)isValueToCode:(NSString *)str;

//6位数字
+ (BOOL)isValueToDealCode:(NSString *)str;

//是否为数字
+ (BOOL)isvaleToNumber:(NSString *)str;

//判断图片格式
+ (NSString *)typeForImageData:(NSData *)data;

//写入图片
+ (UIImage *)writhImageToFileWith:(UIImage *)image;

//裁剪图片
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)size;

//数组排序
+ (NSArray *)sortArrayWith:(NSMutableArray *)array;

//清除缓存
+ (void)cancelWebCache;

//拨打电话
+ (void)makeCall:(UIView *)view phoneNum:(NSString *)str;

//设置tableView底部白色
+ (void)setExtraCellLineHidden: (UITableView *)tableView;

//清除缓存
+ (BOOL)clearCache;

+ (NSString *)calculateTheSizeOfCache;

+ (NSString *)getTimeString;

@end
