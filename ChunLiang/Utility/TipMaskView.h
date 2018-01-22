//
//  TipMaskView.h
//  TestProject
//
//  Created by iOS－Dev on 2017/5/8.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipMaskView : UIView

@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) NSInteger remainCount;

-(instancetype)initWithImages:(NSArray *)images;

@end
