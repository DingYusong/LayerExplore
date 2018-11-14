//
//  DYSDemo03ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo03ViewController.h"
#import "DYSDemo03Layer.h"

@interface DYSDemo03ViewController ()

@end

@implementation DYSDemo03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    DYSDemo03Layer *layer = [DYSDemo03Layer new];
    layer.frame = CGRectMake(0, 100, 100, 100);
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
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
