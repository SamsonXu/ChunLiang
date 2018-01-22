//
//  NoDataButton.m
//  wentoubao
//
//  Created by iOS－Dev on 17/3/9.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "NoDataButton.h"

@implementation NoDataButton

-(instancetype)init{
    if (self = [super init]) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        [self setBackgroundImage:[UIImage imageNamed:@"bottom_btn"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)btnClick{
    
    if ([self.delegate respondsToSelector:@selector(nodataBtnClick:)]) {
        [self.delegate nodataBtnClick:self];
    }
}

@end
