//
//  DYSDemo08ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/16.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo08ViewController.h"

@interface DYSDemo08ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation DYSDemo08ViewController
/**
 “CGAffineTransform中的“仿射”的意思是无论变换矩阵用什么值，图层中平行的两条线在变换之后任然保持平行，”
 
 摘录来自: 钟声. “ios核心动画高级技巧。” Apple Books.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
        self.layerView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:2 animations:^{
//            self.layerView.transform = CGAffineTransformMakeRotation(M_PI*0.9);
            self.layerView.layer.affineTransform = CGAffineTransformMakeRotation(M_PI*0.9);
            
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
