//
//  UIViewNavigationController.m
//  Test
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "UIViewNavigationController.h"

@implementation UINavigationView



@end

@implementation UIViewNavigationController

- (instancetype)initWithRootView:(UINavigationView *)rootView
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)pushView:(UINavigationView *)view animated:(BOOL)animated {
    
}

- (UINavigationView *)popView:(BOOL)animated {
    return nil;
}

- (NSArray<__kindof UINavigationView *> *)popToView:(UINavigationView *)view animated:(BOOL)animated {
    return nil;
}

- (NSArray<__kindof UINavigationView *> *)popToRootView:(BOOL)animated {
    return nil;
}



@end
