//
//  NoDataView.m
//  wentoubao
//
//  Created by iOS－Dev on 17/3/10.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "NoDataView.h"

@implementation NoDataView
{
    UIImageView *_imageView;
    UIButton *_btn;
}

-(instancetype)init{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bottom_wuwangluo"]];
        self.tag = 404;
        [self addSubview:_imageView];
        
        _btn = [[UIButton alloc]init];
        _btn.layer.cornerRadius = 5;
        _btn.layer.masksToBounds = YES;
        [_btn setBackgroundImage:[UIImage imageNamed:@"bottom_btn"] forState:UIControlStateNormal];
        [_btn setTitle:@"重新加载" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        _btn.hidden = YES;
        [self addSubview:_btn];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    KWS(ws);
    
    [_imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.centerY.equalTo(ws).offset(-100);
        make.size.mas_equalTo(CGSizeMake(130, 250));
    }];
    
    if (_loadAgain) {
        _btn.hidden = NO;
    }
    [_btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(_imageView.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(200, 45));
    }];
}

- (void)btnClick{
    
    if ([self.delegate respondsToSelector:@selector(updateView)]) {
        
        [self.delegate updateView];
    }
}

@end
