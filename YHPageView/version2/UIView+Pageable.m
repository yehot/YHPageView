//
//  UIView+Pageable.m
//  Test
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "UIView+Pageable.h"
#import <objc/runtime.h>

static NSString* const kPageAnimateKey = @"YHPageable";

@interface UIView ()

@property (nonatomic, weak) UIView *yh_toView;

@property (nonatomic, assign, readwrite) BOOL yh_inPushing;

@end

@implementation UIView (Pageable)

- (void)yh_pushView:(UIView *)toView {
    NSAssert(CGSizeEqualToSize(toView.frame.size, self.frame.size), @"toView.frame.size != self.frame.size");
    
    // 不支持连续 push 同一个 view
    if ([self.subviews containsObject:self.yh_toView]) {
        return;
    }
    
    self.yh_toView = toView;
    [self yh_switchAnimation];
    self.yh_inPushing = YES;
}


- (void)yh_pop {
    // 无 toView 可 pop
    if (![self.subviews containsObject:self.yh_toView]) {
        return;
    }

    [self yh_switchAnimation];
    self.yh_inPushing = NO;
}

#pragma mark - private

// 基本原理：
//   给 view.layer 加自定义的 CAAnimation，替换掉 [view addSubview:] 和 [view removeFromSuperview] 的 默认动画
//   按照这个思路，只需要修改这里的 CATransitionType type 即可实现各种 转场动画
- (void)yh_switchAnimation {
    if (self.yh_inPushing) {    // pop
        
        [self yh_addTransitionWithType:kCATransitionMoveIn
                               subtype:kCATransitionFromLeft
                              duration:0.25];
        [self.yh_toView removeFromSuperview];
        
    } else {    // push
        
        [self yh_addTransitionWithType:kCATransitionMoveIn
                               subtype:kCATransitionFromRight
                              duration:0.5];
        [self addSubview:self.yh_toView];
    }
}

- (void)yh_addTransitionWithType:(CATransitionType)type
                         subtype:(CATransitionSubtype)subtype
                        duration:(CFTimeInterval)duration {
    
    [self.layer removeAnimationForKey:kPageAnimateKey];
    
    //创建CATransition对象
    CATransition *transition = [CATransition animation];
    //设置运动时间
    transition.duration = duration;
    //设置运动type
    transition.type = type;
    transition.subtype = subtype;
    //设置运动速度
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:transition forKey:kPageAnimateKey];
}

#pragma mark - associate

- (UIView *)yh_toView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYh_toView:(UIView *)view {
    objc_setAssociatedObject(self, @selector(yh_toView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yh_inPushing {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setYh_inPushing:(BOOL)inPushing {
    objc_setAssociatedObject(self, @selector(yh_inPushing), @(inPushing), OBJC_ASSOCIATION_RETAIN);
}

@end
