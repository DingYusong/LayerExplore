//
//  DYSDemo02ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo02ViewController.h"
#import "DYSDemo02LayerDelegate.h"

@interface DYSDemo02ViewController ()<CALayerDelegate>

@property (nonatomic, strong) DYSDemo02LayerDelegate *layerDelegate;

@property (nonatomic, weak) CALayer *subLayer;

@end

@implementation DYSDemo02ViewController

/**
 图层绘图有两种方法，不管使用哪种方法绘制完必须调用图层的setNeedDisplay方法（注意是图层的方法，不是UIView的方法，前面我们介绍过UIView也有此方法）
 
 通过图层代理drawLayer: inContext:方法绘制
 
 通过自定义图层drawInContext:方法绘制
 */


/**
 比较安全的做法是将delegate置为nil，防止野指针存在
 */
- (void)dealloc {
    self.subLayer.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.layerDelegate = [DYSDemo02LayerDelegate new];
    
    CALayer *layer = [CALayer new];
//    layer.delegate = self.layerDelegate;
    layer.delegate = self;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(50, 150);
    
    [self.view.layer addSublayer:layer];
    
    [layer setNeedsDisplay];
    
    self.subLayer = layer;
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
