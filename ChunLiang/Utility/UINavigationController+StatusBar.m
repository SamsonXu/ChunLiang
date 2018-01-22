//
//  UINavigationController+StatusBar.m
//  wentoubao
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return [[self topViewController]preferredStatusBarStyle];
}

@end
