//
//  DYSDemo09ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/16.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo09ViewController.h"

@interface DYSDemo09ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation DYSDemo09ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    
    [self.segControl addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)segClick:(UISegmentedControl *)segControl {
    if (segControl.selectedSegmentIndex == 0) {
        self.layerView.transform = CGAffineTransformIdentity;
        //        self.layerView.layer.affineTransform = CGAffineTransformIdentity;
    }
    else if (segControl.selectedSegmentIndex == 1) {
        self.layerView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:2 animations:^{
            self.layerView.transform = CGAffineTransformMakeTranslation(50, 50);
            //            self.layerView.layer.affineTransform = CGAffineTransformMakeTranslation(50, 50);
        }];
    }
    else if (segControl.selectedSegmentIndex == 2) {
        self.layerView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:2 animations:^{
            self.layerView.transform = CGAffineTransformMakeScale(2, 1.5);
            //            self.layerView.layer.affineTransform = CGAffineTransformMakeScale(2, 1.5);
        }];
    }
    else if (segControl.selectedSegmentIndex == 3) {
        //沿着Y轴旋转，等距投影，感觉只是水平方向出现了压缩而已。
//        self.layerView.layer.doubleSided = NO;//默认是绘制图层的背面，可以设置不绘制图层的背面。
        self.layerView.layer.transform = CATransform3DIdentity;
        [UIView animateWithDuration:2 animations:^{
            //            self.layerView.transform = CGAffineTransformMakeRotation(M_PI*0.9);
            self.layerView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
        }];
    }
    else if (segControl.selectedSegmentIndex == 4) {
        self.layerView.transform = CGAffineTransformIdentity;
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        transform = CGAffineTransformScale(transform, 0.5, 0.5);
        transform = CGAffineTransformTranslate(transform, 50, 50);
        transform = CGAffineTransformRotate(transform, M_PI*0.9);
        
        [UIView animateWithDuration:2 animations:^{
            //            self.layerView.transform = transform;
            self.layerView.layer.affineTransform = transform;
        }];
    }
    else if (segControl.selectedSegmentIndex == 5) {
        //沿着Y轴旋转，透视投影（适应人的视觉需求）
        self.layerView.layer.transform = CATransform3DIdentity;
        
        CATransform3D transform3D = CATransform3DIdentity;
        /*
         “m34（图5.9）用于按比例缩放X和Y的值来计算到底要离视角多远。”
         
         摘录来自: 钟声. “ios核心动画高级技巧。” Apple Books.
         “我们可以通过设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位，那应该如何计算这个距离呢？实际上并不需要，大概估算一个就好了。”
         */
        transform3D.m34 = -1.0/500.0;
        transform3D = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);
        [UIView animateWithDuration:2 animations:^{
            self.layerView.layer.transform = transform3D;
        }];
    }

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
