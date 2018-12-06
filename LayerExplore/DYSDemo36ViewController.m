//
//  DYSDemo36ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/6.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo36ViewController.h"

@interface DYSDemo36ViewController ()

@end

@implementation DYSDemo36ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:5 startAngle:M_PI_4 endAngle:M_PI_4 clockwise:YES];
    
    
    //轨道层
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:shapeLayer];
    
    
    //飞机层
    CALayer *layer = [CALayer layer];
    layer.contents = (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
    layer.frame = CGRectMake(0, 0, 50, 50);
    layer.position = CGPointMake(0, 150);
    [self.view.layer addSublayer:layer];

    //飞机飞行动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = bezierPath.CGPath;
    animation.duration = 5;
//    animation.rotationMode = kCAAnimationRotateAutoReverse;
    animation.rotationMode = kCAAnimationRotateAuto;
    [layer addAnimation:animation forKey:nil];
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
