//
//  DYSDemo31ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/3.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo31ViewController.h"

@interface DYSDemo31ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@property (nonatomic ,strong) CALayer *colorLayer;

@end

@implementation DYSDemo31ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.layerView.bounds;
    [self.layerView.layer addSublayer:self.colorLayer];
}


- (IBAction)changeColor:(id)sender {
    
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    
//    self.layerView.layer.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;
    
    [CATransaction begin];
//    [CATransaction disableActions];
//    [CATransaction setDisableActions:YES];//设置为YES相当于禁用动画了

//    [CATransaction setAnimationDuration:0];//设置为0相当于禁用动画了
    [CATransaction setAnimationDuration:5];
    
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];

    self.colorLayer.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;
    //view禁用掉了隐式动画
//    self.layerView2.layer.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;

    [CATransaction commit];

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
