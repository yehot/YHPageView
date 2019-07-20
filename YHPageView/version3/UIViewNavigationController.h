//
//  UIViewNavigationController.h
//  Test
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIViewNavigationController;

@interface UINavigationView : UIView

// 系统的 UIViewController 持有一个 UINavigationController 属性
// 系统的 UINavigationController 是继承自 UIViewController；
@property (nonatomic, strong, readonly) UIViewNavigationController *viewNavigation;

@end

// 系统的 UINavigationController 是继承自 UIViewController

@interface UIViewNavigationController : UIView


@property(nonatomic,readonly,strong) UINavigationView *topView; // The top view on the stack.
@property(nonatomic,readonly,strong) UINavigationView *visibleView;

@property(nonatomic,copy) NSArray<__kindof UINavigationView *> *subNavigationViews; // The current navview stack.

- (instancetype)initWithRootView:(UINavigationView *)rootView;

- (void)pushView:(UINavigationView *)view animated:(BOOL)animated;

- (UINavigationView *)popView:(BOOL)animated;

- (NSArray<__kindof UINavigationView *> *)popToView:(UINavigationView *)view animated:(BOOL)animated;

- (NSArray<__kindof UINavigationView *> *)popToRootView:(BOOL)animated;


@end
