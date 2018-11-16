//
//  DYSDemo10ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/16.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo10ViewController.h"

@interface DYSDemo10ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation DYSDemo10ViewController
/**
 “CALayer有一个属性叫做sublayerTransform。它也是CATransform3D类型，但和对一个图层的变换不同，它影响到所有的子图层。这意味着你可以一次性对包含这些图层的容器做变换，于是所有的子图层都自动继承了这个变换方法。”
 
 摘录来自: 钟声. “ios核心动画高级技巧。” Apple Books.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [UIImage imageNamed:@"beauty"];
    self.layerView1.layer.contents = (__bridge id)image.CGImage;
    self.layerView2.layer.contents = (__bridge id)image.CGImage;
    
    self.layerView1.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView2.layer.contentsGravity = kCAGravityResizeAspect;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500.0;
    self.containerView.layer.sublayerTransform = perspective;
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
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
