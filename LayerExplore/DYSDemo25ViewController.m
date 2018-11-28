//
//  DYSDemo25ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/28.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo25ViewController.h"
#import "DYSDemo25ReflectionView.h"

@interface DYSDemo25ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet DYSDemo25ReflectionView *reflectionView;

@end

@implementation DYSDemo25ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dys_addReplicatorlayer];
    
    //这样不行应为 CAReplicatorLayer只能作用与子layer  CAReplicatorLayer 作为宿主layer
//    self.reflectionView.layer.contents =  (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
//    self.reflectionView.layer.fillMode = kCAGravityResizeAspect;
    
    UIImage *image = [UIImage imageNamed:@"beauty"];
    UIImageView *imageView = [UIImageView new];
    imageView.image = image;
    imageView.frame = self.reflectionView.bounds;
    [self.reflectionView addSubview:imageView];
    
}

/*
 变换是逐步增加的，每个实例都是相对于前一实例布局。这就是为什么这些复制体最终不会出现在同意位置上
 */
- (void)dys_addReplicatorlayer {
    // Do any additional setup after loading the view from its nib.
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicatorLayer];
    
    
    replicatorLayer.instanceCount = 10;
    
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI/5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    
    replicatorLayer.instanceTransform = transform;
    
    //apply a color shift for each instance
    replicatorLayer.instanceBlueOffset = -0.1;
    replicatorLayer.instanceGreenOffset = -0.1;
    
    
    
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:layer];

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
