//
//  DYSDemo14ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo14ViewController.h"

@interface DYSDemo14ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation DYSDemo14ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    NSLog(@"%.2f",self.view1.layer.zPosition);
    NSLog(@"%.2f",self.view2.layer.zPosition);
    
//    self.view1.layer.zPosition = 1;
    self.view2.layer.zPosition = -1;
    
    //layer是3维的默认zposition是0.所以调整layer的zposition值页面布局会变化。
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
