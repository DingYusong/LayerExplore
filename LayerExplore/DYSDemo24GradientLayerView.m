//
//  DYSDemo24GradientLayerView.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/28.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo24GradientLayerView.h"

@implementation DYSDemo24GradientLayerView


+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (CAGradientLayer *)gradientLayer {
    return (CAGradientLayer *)self.layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
