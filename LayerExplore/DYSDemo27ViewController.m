//
//  DYSDemo27ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/30.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo27ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DYSDemo27ViewController () <CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic ,weak) CATiledLayer *tileLayer;

@end

@implementation DYSDemo27ViewController

- (void)dealloc {
    self.tileLayer.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //方式1：一下子载入大图，内存突然从40m暴增到163m,容易出现crash
//    self.scrollView.contentSize = CGSizeMake(6912, 4320);
    //使用这种方式加载图片，当控制器释放后，图片所占内存不清空，且下次进入时不会重新加载，而是直接使用内存中的图片。
//    UIImage *image = [UIImage imageNamed:@"big1_6912 × 4320.jpg"];
    
    //方式2：使用这种方式加载图片，当控制器释放后，图片所占内存清空
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"big1_6912 × 4320" ofType:@"jpg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//
//    self.scrollView.layer.contents = (__bridge id)image.CGImage;
    
    
    
    //方式3： 按需载入裁剪过的小图，我们可以看到内存几乎没有爆炸性增长，有增长但是是缓慢增长。
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 6912, 4320);
    tileLayer.delegate = self;
    [self.scrollView.layer addSublayer:tileLayer];
    self.scrollView.contentSize = tileLayer.frame.size;
    [tileLayer setNeedsDisplay];
    tileLayer.contentsScale = [UIScreen mainScreen].scale;
    self.tileLayer = tileLayer;
//    tileLayer.fadeDuration = 0;
    
#warning todo
    //图片动画；禁用淡入淡出动画
//    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
//    contentsAnimation.duration = 0;
//    [tileLayer addAnimation:contentsAnimation forKey:nil];
    
    
}



- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    

    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    CGFloat scale = [UIScreen mainScreen].scale;
    NSInteger x = floor(bounds.origin.x/layer.tileSize.width*scale);
    NSInteger y = floor(bounds.origin.y/layer.tileSize.height*scale);
    
    //load tile image
    NSString *imagename = [NSString stringWithFormat:@"big1_6912 × 4320_%02li_%02li",(long)x,(long)y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imagename ofType:@"jpg"];
    UIImage *tileimage = [UIImage imageWithContentsOfFile:imagePath];
    
    UIGraphicsPushContext(ctx);
    [tileimage drawInRect:bounds];
    UIGraphicsPopContext();
    
    [CATransaction commit];
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
