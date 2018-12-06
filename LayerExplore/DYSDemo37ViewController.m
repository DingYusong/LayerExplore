//
//  DYSDemo37ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/6.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo37ViewController.h"

@interface DYSDemo37ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *layer;

@end

@implementation DYSDemo37ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.layer = [CALayer layer];
    self.layer.frame = self.layerView.bounds;
    self.layer.contents = (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
    [self.layerView.layer addSublayer:self.layer];
}

- (IBAction)btnClick:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 5.0;
    
//    animation.keyPath = @"transform";
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*2, 0, 0, 1)];
//    animation.byValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*2, 0, 0, 1)];
    
    animation.keyPath = @"transform.rotation";
//    animation.toValue = @(M_PI*2);
    animation.byValue = @(M_PI*2);

    [self.layer addAnimation:animation forKey:nil];
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
