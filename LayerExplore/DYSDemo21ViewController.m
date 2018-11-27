//
//  DYSDemo21ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/27.
//  Copyright © 2018 丁玉松. All rights reserved.
//

//专用图层：CAShapeLayer
#import "DYSDemo21ViewController.h"

@interface DYSDemo21ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation DYSDemo21ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dys_drawPeople];
    
    // Do any additional setup after loading the view from its nib.
}


- (void)dys_drawPeople {
    //创建火柴人
//    UIBezierPath *path = [UIBezierPath new];
////    [path moveToPoint:CGPointMake(150, 100)];
//    [path addArcWithCenter:CGPointMake(130, 100) radius:20 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//
//    [path moveToPoint:CGPointMake(130, 120)];
//    [path addLineToPoint:CGPointMake(130, 180)];
//
//    [path moveToPoint:CGPointMake(100, 150)];
//    [path addLineToPoint:CGPointMake(160, 150)];
//
//    [path moveToPoint:CGPointMake(130, 180)];
//    [path addLineToPoint:CGPointMake(110, 200)];
//
//    [path moveToPoint:CGPointMake(130, 180)];
//    [path addLineToPoint:CGPointMake(150, 200)];
    
    
    //创建圆角矩形
    CGRect rect = CGRectMake(0, 0, 50, 50);
    UIRectCorner corner = UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft;
    CGSize radii = CGSizeMake(10, 10);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                              byRoundingCorners:corner
                                                    cornerRadii:radii];
    
    
    
    //创建shapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 10;
    shapeLayer.lineCap = kCALineCapButt;
    shapeLayer.lineJoin = kCALineJoinMiter;
    shapeLayer.path = path.CGPath;
    
    
    
    
    
    
//    //create shape layer
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.lineWidth = 5;
//    shapeLayer.lineJoin = kCALineJoinRound;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.path = path.CGPath;

    //add it to our view
    [self.containerView.layer addSublayer:shapeLayer];
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
