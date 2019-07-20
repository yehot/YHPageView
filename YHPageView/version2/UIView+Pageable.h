//
//  UIView+Pageable.h
//  Test
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Pageable)

// demo 使用，实际不需要
@property (nonatomic, assign, readonly) BOOL yh_inPushing;

// toView size 必须等于 self size
// 目前还不能连续 push，如需要，可以像 UINavigationController 内部维护一个 array
- (void)yh_pushView:(UIView *)toView;

- (void)yh_pop;

@end
