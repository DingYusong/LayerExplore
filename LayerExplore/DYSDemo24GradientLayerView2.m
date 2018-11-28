//
//  DYSDemo24GradientLayerView2.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/28.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo24GradientLayerView2.h"

@implementation DYSDemo24GradientLayerView2


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        
        CGColorRef redRef = [UIColor redColor].CGColor;
        CGColorRef greenRef = [UIColor greenColor].CGColor;
        NSArray *colorArray = @[(__bridge id)redRef, (__bridge id)greenRef];
        gradientLayer.colors = colorArray;
        
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1, 0.5);
        
        gradientLayer.frame = self.bounds;
        
        [self.layer addSublayer:gradientLayer];
        
        self.gradientLayer = gradientLayer;
    }
    return self;
}

// override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.
- (void)layoutSubviews {
    self.gradientLayer.frame = self.bounds;
}


@end
