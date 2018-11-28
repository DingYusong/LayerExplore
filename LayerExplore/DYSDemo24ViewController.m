//
//  DYSDemo24ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/28.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo24ViewController.h"
#import "DYSDemo24GradientLayerView.h"
#import "DYSDemo24GradientLayerView2.h"

@interface DYSDemo24ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gradientLayerView;
@property (weak, nonatomic) IBOutlet DYSDemo24GradientLayerView *gradientLayerView1;
@property (weak, nonatomic) IBOutlet DYSDemo24GradientLayerView2 *gradientLayerView2;

@end

@implementation DYSDemo24ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dys_addGradientLayer];
    [self dys_addGradientLayer1];
    [self dys_addGradientLayer2];
    // Do any additional setup after loading the view from its nib.
}

- (void)dys_addGradientLayer {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    CGColorRef redRef = [UIColor redColor].CGColor;
    CGColorRef greenRef = [UIColor greenColor].CGColor;
    NSArray *colorArray = @[(__bridge id)redRef, (__bridge id)greenRef];
    gradientLayer.colors = colorArray;
    
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    gradientLayer.frame = self.gradientLayerView.bounds;
    
    [self.gradientLayerView.layer addSublayer:gradientLayer];
}

- (void)dys_addGradientLayer1 {
    CAGradientLayer *gradientLayer = [self.gradientLayerView1 gradientLayer];
    
    CGColorRef redRef = [UIColor redColor].CGColor;
    CGColorRef greenRef = [UIColor greenColor].CGColor;
    NSArray *colorArray = @[(__bridge id)redRef, (__bridge id)greenRef];
    gradientLayer.colors = colorArray;
    
    // 默认是从上到下
//    gradientLayer.startPoint = CGPointMake(0, 0.5);
//    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
}

- (void)dys_addGradientLayer2 {

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
