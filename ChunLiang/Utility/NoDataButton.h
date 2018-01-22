//
//  NoDataButton.h
//  wentoubao
//
//  Created by iOS－Dev on 17/3/9.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  NoDataButtonDelegate<NSObject>

- (void)nodataBtnClick:(UIButton *)sender;

@end

@interface NoDataButton : UIButton

@property (nonatomic, weak) id<NoDataButtonDelegate>delegate;

-(instancetype)init;

@end
