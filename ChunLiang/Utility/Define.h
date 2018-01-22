//
//  Define.h
//  ChunLiang
//
//  Created by admin on 2018/1/22.
//  Copyright © 2018年 ChunLiang. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define KURL(url) [NSString stringWithFormat:@"%@",url]
#define KChunLiangKey @""

//获取系统版本
#define KIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//屏幕的物理高度和宽度
#define KScreenWidth    [UIScreen mainScreen].bounds.size.width

#define KScreenHeight   [UIScreen mainScreen].bounds.size.height

//颜色
#define KGrayColor  [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1]

#define KBlueColor   [UIColor colorWithRed:14/255.0 green:110/255.0 blue:182/255.0 alpha:1]

#define KTextColor  [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]

#define KMoneColor [UIColor colorWithRed:230/255.0 green:113/255.0 blue:62/255.0 alpha:1]

#define KGrayTextColor  [UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1]

#define KNewMoneyColor [UIColor colorWithRed:236/255.0 green:13/255.0 blue:26/255.0 alpha:1]

#define KBtnGrayColor [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1]

#define KColorRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define KColorRGB(r,g,b) KColorRGBA(r,g,b,1)

#define KWS(ws) __weak typeof (self) ws = self

#define KIPHONE6 [UIScreen mainScreen].bounds.size.width > 320?YES:NO

#define KIPHONEX [UIScreen mainScreen].bounds.size.height == 812?YES:NO

#define KScreenPropor [UIScreen mainScreen].bounds.size.width/375.0

#define KInsetForX [UIScreen mainScreen].bounds.size.height == 812?20.f:0.f

#define KBootomForX [UIScreen mainScreen].bounds.size.height == 812?34.f:0.f

#endif /* Define_h */
