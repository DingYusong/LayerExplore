//
//  DYSDemo33ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/3.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo33ViewController.h"

@interface DYSDemo33ViewController ()
@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation DYSDemo33ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

//让移动的图层响应交互
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        int R = (arc4random() % 256);
        int G = (arc4random() % 256);
        int B = (arc4random() % 256);
        
        self.colorLayer.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0].CGColor;

    }
    else {
//        [CATransaction begin];
//        [CATransaction setAnimationDuration:4];
        
        self.colorLayer.position = point;
        
//        [CATransaction commit];
        
        
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
