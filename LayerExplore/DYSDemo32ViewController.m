//
//  DYSDemo32ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/3.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo32ViewController.h"

@interface DYSDemo32ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation DYSDemo32ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self yyi_logActionLayer];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.layerView.bounds;
    [self.layerView.layer addSublayer:self.colorLayer];
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor":transition};        
}

/**
 每个UIView对它关联的图层都扮演了一个委托，并且提供了-actionForLayer:forKey的实现方法。当不在一个动画块的实现中，UIView对所有图层行为返回nil，但是在动画block范围之内，它就返回了一个非空值。我们可以用一个demo做个简单的实验（清单7.5）
 */
- (void)yyi_logActionLayer {
    NSLog(@"OutSide:%@",[self.layerView.layer actionForKey:@"backgroundColor"]);
    NSLog(@"OutSide:%@",[self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    
    [UIView beginAnimations:nil context:nil];
    
    NSLog(@"InSide:%@",[self.layerView.layer actionForKey:@"backgroundColor"]);
    NSLog(@"InSide:%@",[self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);

    [UIView commitAnimations];
}


- (IBAction)changeClick:(id)sender {
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);

    self.colorLayer.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;

    
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
