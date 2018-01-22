//
//  WTHMJRefreshHeader.m
//  wentoubao
//
//  Created by iOS－Dev on 2017/6/19.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "WTHMJRefreshHeader.h"

@implementation WTHMJRefreshHeader

- (void)prepare{
    [super prepare];
    
    NSMutableArray *IdleArray = [[NSMutableArray alloc]init];
    
    UIImage *image = [UIImage imageNamed:@"loading_blue_complete"];
    [IdleArray addObject:image];
    
    for (NSInteger i = 1; i <= 42; i++) {
        if (i%2 == 0) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_blue%ld",i]];
            [IdleArray addObject:image];
        }
        
    }
    
    [self setImages:IdleArray forState:MJRefreshStateIdle];
    
    NSMutableArray *refreshArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 1; i <= 42; i++) {
        if (i%2 == 0) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_blue%ld",i]];
            [refreshArray addObject:image];
        }
        
    }
    [self setImages:refreshArray forState:MJRefreshStateRefreshing];
    [self setImages:refreshArray forState:MJRefreshStatePulling];
    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
}

@end
