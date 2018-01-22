//
//  WTHImageView.m
//  wentoubao
//
//  Created by iOS－Dev on 16/9/29.
//  Copyright © 2016年 joinbank. All rights reserved.
//

#import "WTHImageView.h"//暂无数据底图

@implementation WTHImageView

+ (WTHImageView *)shareImage{
    static WTHImageView *imageView;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!imageView) {
            imageView = [[WTHImageView alloc]init];
        }
    });
    return imageView;
}

- (void)showWithFram:(CGRect)fram image:(NSString *)image onView:(UIView *)view{
    
    UIView *tempView = [view viewWithTag:20];
    if (tempView) {
        return;
    }
    
    UIView *nodataView = [[UIView alloc]initWithFrame:fram];
    nodataView.tag = 20;
    nodataView.backgroundColor = KColorRGB(244, 244, 244);
    [view addSubview:nodataView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image]];
    [nodataView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(nodataView);
        make.size.mas_equalTo(CGSizeMake(175, 180));
    }];
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView*)view;
        scrollView.scrollEnabled = NO;
    }
}

- (void)dismissFromView:(UIView *)tableView{
    
    UIView *nodataView = [tableView viewWithTag:20];
    [nodataView removeFromSuperview];
    
    if ([tableView isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView*)tableView;
        scrollView.scrollEnabled = YES;
    }
}

@end
