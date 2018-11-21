//
//  DYSDemo18ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo18ViewController.h"

@interface DYSDemo18ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DYSDemo18ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //create mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.layerView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"buddle"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    
    //apply mask to image layer￼
    self.imageView.layer.mask = maskLayer;
    
    
    
    
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
