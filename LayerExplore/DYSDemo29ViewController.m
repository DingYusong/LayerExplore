//
//  DYSDemo29ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/30.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo29ViewController.h"

#warning todo

@interface DYSDemo29ViewController ()
@property (weak, nonatomic) IBOutlet UIView *glView;

@end

@implementation DYSDemo29ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    CAEAGLLayer *eaglLayer = [CAEAGLLayer layer];
    eaglLayer.frame = self.glView.bounds;
    [self.glView.layer addSublayer:eaglLayer];
    
    
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
