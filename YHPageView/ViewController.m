//
//  ViewController.m
//  Test
//
//  Created by yehot on 2019/7/10.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "ViewController.h"
#import "PageView.h"
#import "UIView+Pageable.h"

#import "DemoViewA.h"
#import "DemoViewB.h"

// demo 切换
#define DemoSwitch 2

@interface ViewController ()

@property (nonatomic, strong) DemoViewA *view1;
@property (nonatomic, strong) DemoViewB *view2;


@property (nonatomic, strong) PageView *pageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    if (DemoSwitch == 1) {
        [self addDemo1];
    } else {
        [self addDemo2];
    }
}

#pragma mark - demo1

- (void)addDemo1 {
    [self.view addSubview:self.pageView];
    [self.pageView setupPageA:self.view1];
}

- (void)demo1Action {
    if (self.pageView.isInPushing) {
        [self.pageView pop];
    } else {
        [self.pageView pushToPageB:self.view2];
    }
}

#pragma mark - demo2

- (void)addDemo2 {
    [self.view addSubview:self.view1];
    self.view1.frame = CGRectMake(0, 300, self.view.frame.size.width, 300);
}

- (void)demo2Action {
    if (self.view1.yh_inPushing) {
        [self.view1 yh_pop];
    } else {
        [self.view1 yh_pushView:self.view2];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
    if (DemoSwitch == 1) {
        [self demo1Action];
    } else {
        [self demo2Action];
    }
}

- (PageView *)pageView {
    if (!_pageView) {
        _pageView = [[PageView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 300)];
    }
    return _pageView;
}

- (DemoViewA *)view1 {
    if (!_view1) {
        _view1 = [[DemoViewA alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    }
    return _view1;
}

- (DemoViewB *)view2 {
    if (!_view2) {
        _view2 = [[DemoViewB alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    }
    return _view2;
}


@end
