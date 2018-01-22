//
//  TipMaskView.m
//  TestProject
//
//  Created by iOS－Dev on 2017/5/8.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "TipMaskView.h"

@implementation TipMaskView

-(instancetype)initWithImages:(NSArray *)images{
    
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.imageArray = images;
    }
    return self;
}

- (void)setImageArray:(NSArray *)imageArray{
    
    _imageArray = imageArray;
    _remainCount = imageArray.count;
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.frame];
    self.imageView.image = [UIImage imageNamed:imageArray[0]];
    
    /**根据设备类型判断需要添加的图片
     
     这里暂时给iphone5图片命名拼接_temp字段，具体命名规范可以根据个人习惯进行修改
     
     */
    if (KIPHONEX == YES){
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_X",imageArray[0]]];
    }else if (KIPHONE6 == YES) {
        self.imageView.image = [UIImage imageNamed:imageArray[0]];
    }else{
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_5",imageArray[0]]];
        
    };
    self.imageView.userInteractionEnabled = YES;
    [self addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMask:)];
    [self addGestureRecognizer:tap];
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    
}

- (void)hideMask:(UITapGestureRecognizer *)sender{
    
    __weak typeof(self) weakSelf = self;
    _remainCount--;
    
    if (_remainCount == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
            sender.enabled = YES;
        }];
    }else{
        
        if (KIPHONEX == YES){
            self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_X",_imageArray[_imageArray.count-_remainCount]]];
        }else if (KIPHONE6 == YES) {
            self.imageView.image = [UIImage imageNamed:_imageArray[_imageArray.count-_remainCount]];
        }else{
            self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_5",_imageArray[_imageArray.count-_remainCount]]];
            
        };
    }
    
}

@end
