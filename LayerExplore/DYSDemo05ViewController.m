//
//  DYSDemo05ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/16.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo05ViewController.h"

@interface DYSDemo05ViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation DYSDemo05ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"2018-004");
    
//    UIImage *image = [UIImage imageNamed:@"banner1"];
    UIImage *image = [UIImage imageNamed:@"buddle"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;

    //效果一样
//    self.layerView.contentMode = UIViewContentModeScaleAspectFit;
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    
    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = 1.0;
//    self.view.contentScaleFactor = 1.0;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.view.contentScaleFactor = [UIScreen mainScreen].scale;
//    self.layerView.layer.contentsScale = image.scale;

//    self.layerView.layer.masksToBounds = YES;
    self.layerView.clipsToBounds = YES;
    
//    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
//    self.layerView.layer.contentsCenter = CGRectMake(0.3, 0.6, 0.4, 0.1);
    //气泡拉伸
    self.layerView.layer.contentsCenter = CGRectMake(0.4, 0.8, 0.2, 0.1);
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
