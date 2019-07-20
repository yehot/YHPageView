//
//  PageView.h
//  Test
//
//  Created by yehot on 2019/7/19.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView

@property (nonatomic, assign, readonly, getter=isInPushing) BOOL inPushing;

// PageA 必须和 self frame 一致
- (void)setupPageA:(UIView *)view1;
// PageB 必须和 self frame 一致
- (void)pushToPageB:(UIView *)view2;

- (void)pop;

@end

