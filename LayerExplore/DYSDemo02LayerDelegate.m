//
//  DYSDemo02LayerDelegate.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo02LayerDelegate.h"

@implementation DYSDemo02LayerDelegate

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    //2.创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    
    //添加路径到画布
    CGContextAddPath(ctx, path);
    
    //3.设置图形上下文的状态属性
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(ctx, 0, 1.0, 0, 1);
    
    //4.开始绘画
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //5.释放path
    CGPathRelease(path);
}

@end
