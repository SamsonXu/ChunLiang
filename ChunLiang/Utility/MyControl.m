//
//  MyLabel.m
//  MyFamily
//
//  Created by qianfeng on 16/3/17.
//  Copyright (c) 2016年 Motion. All rights reserved.
//

#import "MyControl.h"
#import "UIImageView+WebCache.h"
#import <CommonCrypto/CommonDigest.h>
@implementation MyControl

+ (UIButton *)createNavLeftBtn{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_black"]];
    [leftBtn addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(leftBtn);
        make.size.mas_equalTo(CGSizeMake(12, 20));
    }];
    return leftBtn;
}

+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num{
    return [self labelWithTitle:title fram:CGRectMake(0,0,0,0) color:color fontOfSize:fontOfSize numberOfLine:num];
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram fontOfSize:(CGFloat)fontOfSize
{
    return [self labelWithTitle:title fram:fram fontOfSize:fontOfSize numberOfLine:1];
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram  fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num
{
    return [self labelWithTitle:title fram:fram color:[UIColor blackColor] fontOfSize:fontOfSize numberOfLine:num];
}

+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize numberOfLine:(NSInteger)num
{
    UILabel *label = [[UILabel alloc]initWithFrame:fram];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontOfSize];
    label.numberOfLines = num;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    return label;
}

+ (UILabel *)boldLabelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(CGFloat)fontOfSize{
    UILabel *label = [[UILabel alloc]initWithFrame:fram];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont boldSystemFontOfSize:fontOfSize];
    label.numberOfLines = 1;
    return label;
}

+ (UIImageView *)imageViewWithFram:(CGRect)fram imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:fram];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

+ (UIImageView *)imageViewWithFram:(CGRect)fram url:(NSString *)imageUrl{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:fram];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    return imageView;
}

+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = fram;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag
{
    UIButton *btn = [self buttonWithFram:fram title:title imageName:imageName];
    btn.tag = tag;
    return btn;
}

+ (NSArray *)getAnswerWithString:(NSString *)str{
    NSArray *array = [str componentsSeparatedByString:@",|,"];
    return array;
}


+ (CGSize)getSizeWithString:(NSString *)str font:(UIFont *)font size:(CGSize)size{
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
    return newSize;
}


+ (UILabel *)setLineSpaceWithLabel:(UILabel *)label{
    UILabel * cLabel = [UILabel new];
    cLabel = label;
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:10];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [label.text length])];
    [cLabel setAttributedText:attributedString1];
    [cLabel sizeToFit];
    return cLabel;
}

+ (BOOL)isValueToPhoneNumber:(NSString *)str{
    NSString *num = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *numPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",num];
    return [numPre evaluateWithObject:str];
}

+ (BOOL)isValueToCode:(NSString *)str{
    NSString *num = @"^.{6,20}$";
    NSPredicate *numPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",num];
    return [numPre evaluateWithObject:str];
}

+ (BOOL)isValueToDealCode:(NSString *)str{
    NSString *num = @"^\\d{6}$";
    NSPredicate *numPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",num];
    return [numPre evaluateWithObject:str];
}

+ (BOOL)isvaleToNumber:(NSString *)str{
    NSString *num = @"^[0-9]*$";
    NSPredicate *numPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",num];
    return [numPre evaluateWithObject:str];
}

+ (NSString *)typeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

+ (UIImage *)writhImageToFileWith:(UIImage *)image{
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/selfPhoto.jpg"];
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    success = [fileManager fileExistsAtPath:filePath];
    if(success) {
        //        NSLog(@"success");
        success = [fileManager removeItemAtPath:filePath error:&error];
    }
    //将图片尺寸改为80*80
    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(100, 100)];
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:filePath atomically:YES];//写入文件
    return smallImage;
}

+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)size
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (size.width/size.height > oldsize.width/oldsize.height) {
            rect.size.width = size.height*oldsize.width/oldsize.height;
            rect.size.height = size.height;
            rect.origin.x = (size.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = size.width;
            rect.size.height = size.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (size.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, size.width, size.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

+ (NSArray *)sortArrayWith:(NSMutableArray *)array{
    for (int i = 0; i < array.count-1; i++) {
        for (int j = 0; j < array.count-i-1; j++) {
            if ([array[j] compare:array[j+1]] ==  NSOrderedDescending) {
                NSString *str = array[j];
                array[j] = array[j+1];
                array[j+1] = str;
            }
        }
    }
    return array;
}

+ (void)cancelWebCache
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies])  {
        [storage deleteCookie:cookie];
    }
}

+ (void)makeCall:(UIView *)view phoneNum:(NSString *)str
{
    //判断设备
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",str]];
        UIWebView *callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:url]];
        [view addSubview:callWebview];
    } else {
        
    }
}

+ (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}

+ (BOOL)clearCache{
    
    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:cachePath]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:cachePath];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *fileAbsolutePath=[cachePath stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:fileAbsolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
    
    return YES;
}

+ (NSString *)calculateTheSizeOfCache{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isFile = NO;
    
    BOOL isExit = [fileManager fileExistsAtPath:path isDirectory:&isFile];
    
    CGFloat totalBytes = 0;
    if (isExit) {
        
        if (!isFile) {
            totalBytes = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        }else{
            
            NSArray *array = [fileManager subpathsAtPath:path];
            for (NSString *subPath in array) {
                NSString *fullPath = [path stringByAppendingFormat:@"/%@",subPath];
                BOOL hasContent = NO;
                [fileManager fileExistsAtPath:fullPath isDirectory:&hasContent];
                
                if (!hasContent) {
                    totalBytes += [fileManager attributesOfItemAtPath:fullPath error:nil].fileSize;
                }
                
            }
        }
        
    }
    
    totalBytes += [[SDImageCache sharedImageCache] getSize];
    
    if (totalBytes > powf(10, 6)) {
        return [NSString stringWithFormat:@"%.2fMB",totalBytes/powf(10, 6)];
    }else{
        return [NSString stringWithFormat:@"%.2fKB",totalBytes/powf(10, 9)];
    }
}

+ (NSString *)getTimeString{
    NSDate *curDate = [NSDate date];//获取当前日期
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy/MM/dd"];//这里去掉 具体时间 保留日期
    NSString *dateString = [formater stringFromDate:curDate];
    NSDate *date = [formater dateFromString:dateString];
    
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return timeString;
}

@end
