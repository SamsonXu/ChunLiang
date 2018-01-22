//
//  WTHImageView.h
//  wentoubao
//
//  Created by iOS－Dev on 16/9/29.
//  Copyright © 2016年 joinbank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTHImageView : UIImageView

@property (nonatomic, assign) BOOL hasImage;

+ (WTHImageView *)shareImage;

- (void)showWithFram:(CGRect)fram image:(NSString *)image onView:(UIView *)view;

- (void)dismissFromView:(UIView *)tableView;

@end
