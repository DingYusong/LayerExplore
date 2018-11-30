//
//  DYSDemo28EmitterLayerView.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/30.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo28EmitterLayerView.h"

@implementation DYSDemo28EmitterLayerView

+ (Class)layerClass {
    return [CAEmitterLayer class];
}


- (void)yyi_init {
    CAEmitterLayer *emitterLayer = (CAEmitterLayer *)self.layer;
    //configure emitter
    //控制是否叠加
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    //粒子效果的中心
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width / 2.0, emitterLayer.frame.size.height / 2.0);

    CAEmitterCell *emitterCell = [CAEmitterCell new];
    emitterCell.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    //每秒生成多少个
    emitterCell.birthRate = 300;
    //生成时间
    emitterCell.lifetime = 5.0;
    
    emitterCell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    emitterCell.alphaSpeed = -0.4;
    //速率
    emitterCell.velocity = 50;
    //速率随机范围
    emitterCell.velocityRange = 500;
    //发射角度范围
    emitterCell.emissionRange = M_PI * 2.0;

    emitterLayer.emitterCells = @[emitterCell];    
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self yyi_init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self yyi_init];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
