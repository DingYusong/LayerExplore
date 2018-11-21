//
//  DYSDemo17ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo17ViewController.h"

@interface DYSDemo17ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation DYSDemo17ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerView1.layer.shadowOpacity = 0.5;
    self.layerView2.layer.shadowOpacity = 0.5;
    
    self.layerView1.backgroundColor = [UIColor clearColor];
    self.layerView2.backgroundColor = [UIColor clearColor];

    
    // Do any additional setup after loading the view from its nib.
    self.layerView1.layer.contents = (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
    self.layerView2.layer.contents = (__bridge id)[UIImage imageNamed:@"beauty"].CGImage;
    self.layerView1.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView2.layer.contentsGravity = kCAGravityResizeAspect;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
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
