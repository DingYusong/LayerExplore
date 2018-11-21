//
//  DYSDemo16ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo16ViewController.h"

@interface DYSDemo16ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation DYSDemo16ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.layerView1.layer.cornerRadius = 20.0f;
    self.layerView2.layer.cornerRadius = 20.0f;
    self.shadowView.layer.cornerRadius = 20.0f;
    //默认情况下，这个曲率值只影响背景颜色而不影响背景图片或是子图层。不过，如果把masksToBounds设置成YES的话，图层里面的所有东西都会被截取。conrnerRadius
    
    self.layerView1.layer.borderWidth = 5.0f;
    self.layerView2.layer.borderWidth = 5.0f;
    //边框是跟随图层的边界变化的，而不是图层里面的内容  “仔细观察会发现边框并不会把寄宿图或子图层的形状计算进来，如果图层的子图层超过了边界，或者是寄宿图在透明区域有一个透明蒙板，边框仍然会沿着图层的边界绘制出来（如图4.4）.”
    
    
    //add a shadow to layerView1
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView1.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layerView1.layer.shadowRadius = 5.0f;

    //add a shadow to layerView2  masksToBounds 阴影被切掉了，使用容器阴影解决
    self.layerView2.layer.shadowOpacity = 0.5f;
    self.layerView2.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layerView2.layer.shadowRadius = 5.0f;
    
    self.layerView2.layer.masksToBounds = YES;
    
    //add same shadow to shadowView (not layerView2)
    self.shadowView.layer.shadowOpacity = 0.5f;
    self.shadowView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.shadowView.layer.shadowRadius = 5.0f;
    
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
