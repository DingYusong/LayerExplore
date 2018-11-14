//
//  DYSDemo03Layer.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo03Layer.h"

@implementation DYSDemo03Layer

- (void)drawInContext:(CGContextRef)ctx {
    [self yyi_draw4WithContext:ctx];
}

- (void)yyi_draw4WithContext:(CGContextRef)ctx {
    //1.获取画布
    CGContextRef context = ctx;
    
    //2.创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    
    //添加路径到画布
    CGContextAddPath(context, path);
    
    //3.设置图形上下文的状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);
    
    //4.开始绘画
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //5.释放path
    CGPathRelease(path);
}

@end
