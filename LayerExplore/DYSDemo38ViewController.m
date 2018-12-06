//
//  DYSDemo38ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/6.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo38ViewController.h"

@interface DYSDemo38ViewController ()

@end

@implementation DYSDemo38ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
//    animation2.duration = 5.0;
//    animation2.keyPath = @"transform.rotation";
    animation2.keyPath = @"transform";
    animation2.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];

    
//    animation2.byValue = @(M_PI*2);

    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation2];
    group.duration = 5;
    
    [layer addAnimation:group forKey:nil];
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
