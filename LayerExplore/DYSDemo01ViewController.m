//
//  DYSDemo01ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo01ViewController.h"

@interface DYSDemo01ViewController ()

@end

@implementation DYSDemo01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#define WIDTH 50

- (IBAction)btnClick:(id)sender {
    //添加一个layer
    
    CALayer *layer = [CALayer new];
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers[1];
    CGFloat width = layer.bounds.size.width;
    if (width == WIDTH) {
        width = WIDTH*4;
    }
    else{
        width = WIDTH;
    }
    //修改图层的属性会形成动画效果，根图层除外
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width/2;
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
