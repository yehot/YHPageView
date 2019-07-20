//
//  PageView.m
//  Test
//
//  Created by yehot on 2019/7/19.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "PageView.h"

@interface PageView ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;

@property (nonatomic, assign) BOOL inPushing;

@end

@implementation PageView

- (void)setupPageA:(UIView *)view1 {
    
    NSAssert(CGSizeEqualToSize(view1.frame.size, self.frame.size), @"PageA size != self size");
    
    [self addSubview:view1];
}


- (void)pushToPageB:(UIView *)view2 {
    NSAssert(CGSizeEqualToSize(view2.frame.size, self.frame.size), @"PageB size != self size");

    self.inPushing = YES;
    self.view2 = view2;
    
    [self switchAnimation];
}

- (void)pop {
    self.inPushing = NO;
    
    [self switchAnimation];
}

#pragma mark - private

- (void)switchAnimation {
    if (self.inPushing) {

        [self transitionAddToView:self type:kCATransitionMoveIn subtype:kCATransitionFromRight duration:0.5];
        [self addSubview:self.view2];

    } else {
        
        [self transitionAddToView:self type:kCATransitionMoveIn subtype:kCATransitionFromLeft duration:0.25];
        [self.view2 removeFromSuperview];
    }
}

- (void)transitionAddToView:(UIView *)view
                       type:(CATransitionType)type
                    subtype:(CATransitionSubtype)subtype
                   duration:(CFTimeInterval)duration {
    
    
    //创建CATransition对象
    CATransition *transition = [CATransition animation];
    //设置运动时间
    transition.duration = duration;
    //设置运动type
    transition.type = type;
    transition.subtype = subtype;
    //设置运动速度
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [view.layer addAnimation:transition forKey:@"animation"];
}

@end
