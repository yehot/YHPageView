//
//  DemoViewB.m
//  YHPageView
//
//  Created by yehot on 2019/7/20.
//  Copyright © 2019 Xin Hua Zhi Yun. All rights reserved.
//

#import "DemoViewB.h"

@implementation DemoViewB

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView* imgeV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2.jpg"]];
        imgeV.frame = frame;
        [self addSubview:imgeV];
        
        
        UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backButton.backgroundColor = [UIColor whiteColor];
        [self addSubview:backButton];
        
    }
    return self;
}

@end
