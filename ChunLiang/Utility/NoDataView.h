//
//  NoDataView.h
//  wentoubao
//
//  Created by iOS－Dev on 17/3/10.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoDataViewDelegate<NSObject>

- (void)updateView;

@end

@interface NoDataView : UIView

@property (nonatomic, weak)id<NoDataViewDelegate>delegate;

@property (nonatomic, assign) BOOL loadAgain;

- (instancetype)init;

@end
