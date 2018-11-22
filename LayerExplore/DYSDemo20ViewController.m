//
//  DYSDemo20ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo20ViewController.h"

@interface DYSDemo20ViewController ()
@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation DYSDemo20ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*
    理想情况下，我们希望先不考虑layer的alpha值，把子layer什么的合并成一个图片，然后对这张图片统一设置alpha值。
    有两种方法可以达到这个效果
    设置Info.plist文件中的UIViewGroupOpacity为YES。在iOS7以后已经默认设置了，iOS6没有设置。
    在Info.plist文件中的UIViewGroupOpacity为NO，则可以看到demo20-1.png的情况，此时可用组视图来解决问题。
     
     
    设置组透明。
    */
    
    //create opaque button
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(150, 150);
    button1.alpha = 0.5;
    [self.containerView addSubview:button1];
    
    //create translucent button
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(150, 250);
    button2.alpha = 0.5;
    [self.containerView addSubview:button2];
    
    //enable rasterization for the translucent button
    button2.layer.shouldRasterize = YES;
    button2.layer.rasterizationScale = [UIScreen mainScreen].scale;

}
- (UIButton *)customButton {
    
    //create button
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    
    //add label
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;

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
