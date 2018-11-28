//
//  DYSDemo22ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/27.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo22ViewController.h"
#import <CoreText/CoreText.h>
#import "DYSDemo22TextLayerLabel.h"

@interface DYSDemo22ViewController ()
@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (weak, nonatomic) IBOutlet UIView *labelView2;
@property (weak, nonatomic) IBOutlet DYSDemo22TextLayerLabel *layerLabel;

@end

@implementation DYSDemo22ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self dys_addLabelView];
    [self dys_addLabelView2];

    self.layerLabel.text = @"【1至10月北京市商品房销售面积同比下降24%】北京市统计局发布的最新数据显示，今年1至10月，北京市商品房销售面积为461.4万平方米，同比下降24%，其中住宅销售面积为347.9万平方米，同比下降13.6%。";
}

- (void)dys_addLabelView {
    CATextLayer *textLayer = [CATextLayer new];
    
//    textLayer.bounds = CGRectMake(0, 0, 50, 50);
//    textLayer.position = self.labelView.center;
    textLayer.frame = self.labelView.bounds;
    
    NSString *str = @"【1至10月北京市商品房销售面积同比下降24%】北京市统计局发布的最新数据显示，今年1至10月，北京市商品房销售面积为461.4万平方米，同比下降24%，其中住宅销售面积为347.9万平方米，同比下降13.6%。";
    textLayer.string = str;
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    
    UIFont *font = [UIFont systemFontOfSize:13];
    textLayer.fontSize = font.pointSize;
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.wrapped = YES;
    
    /*
     如果你仔细看这个文本，你会发现一个奇怪的地方：这些文本有一些像素化了。这是因为并没有以Retina的方式渲染，第二章提到了这个contentScale属性，用来决定图层内容应该以怎样的分辨率来渲染。contentsScale并不关心屏幕的拉伸因素而总是默认为1.0。如果我们想以Retina的质量来显示文字，我们就得手动地设置CATextLayer的contentsScale属性
     */
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.labelView.layer addSublayer:textLayer];
}

- (void)dys_addLabelView2 {
    CATextLayer *textLayer = [CATextLayer new];
    
    //textLayer.bounds = CGRectMake(0, 0, 50, 50);
    //textLayer.position = self.labelView.center;
    textLayer.frame = self.labelView2.bounds;
    

    
    
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    
    UIFont *font = [UIFont systemFontOfSize:13];
//    textLayer.fontSize = font.pointSize;
//    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
//    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
//    textLayer.font = fontRef;
    
    textLayer.wrapped = YES;

    
    
    
    NSString *str = @"【1至10月北京市商品房销售面积同比下降24%】北京市统计局发布的最新数据显示，今年1至10月，北京市商品房销售面积为461.4万平方米，同比下降24%，其中住宅销售面积为347.9万平方米，同比下降13.6%。";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSDictionary *attrib = @{NSForegroundColorAttributeName:[UIColor redColor]};
    //    [string setAttributes:attrib range:NSMakeRange(10, 20)];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    NSDictionary *attri = @{(__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)kCTFontAttributeName:(__bridge id)fontRef,
                            };
    
    
    [string setAttributes:attri range:NSMakeRange(10, 10)];
    
    
    
    
    textLayer.string = string;
    
    
    
    
    /*
     如果你仔细看这个文本，你会发现一个奇怪的地方：这些文本有一些像素化了。这是因为并没有以Retina的方式渲染，第二章提到了这个contentScale属性，用来决定图层内容应该以怎样的分辨率来渲染。contentsScale并不关心屏幕的拉伸因素而总是默认为1.0。如果我们想以Retina的质量来显示文字，我们就得手动地设置CATextLayer的contentsScale属性
     */
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.labelView2.layer addSublayer:textLayer];
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
