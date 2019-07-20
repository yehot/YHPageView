//
//  DemoViewA.m
//  YHPageView
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "DemoViewA.h"

@implementation DemoViewA

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* imgeV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]];
        imgeV.frame = frame;
        [self addSubview:imgeV];
    }
    return self;
}

@end
