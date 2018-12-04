//
//  DYSDemo34ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/4.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo34ViewController.h"

@interface DYSDemo34ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation DYSDemo34ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 属性动画-代理模式
 */
- (void)yyi_addDelegateAnimation {
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = self.layerView.bounds;
    [self.layerView.layer addSublayer:colorLayer];
    
    
}

- (IBAction)changeClick:(id)sender {    
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;
    
    [self.colorLayer addAnimation:animation forKey:nil];
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
