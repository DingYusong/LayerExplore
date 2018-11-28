//
//  DYSDemo22TextLayerLabel.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/27.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo22TextLayerLabel.h"

@implementation DYSDemo22TextLayerLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


/**
 
 基于CATextLayer的标签可能就有有些局限性。但是总得来说，如果想在app里面充分利用CALayer子类，用+layerClass来创建基于不同图层的视图是一个简单可复用的方法。
 
 使用CATextLayer 来替换默认的CALayer

 @return 创建一个CATextLayer
 */
+ (Class)layerClass {
    return [CATextLayer class];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [self setUp];
}

-(void)setText:(NSString *)text {
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor {
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}


- (CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}

/*
 你会发现文本并没有像素化，而我们也没有设置contentsScale属性。把CATextLayer作为宿主图层的另一好处就是视图自动设置了contentsScale属性。
 */
- (void)setUp {
    //默认设置从UILabel中来
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    //we should really derive these from the UILabel settings too
    //but that's complicated, so for now we'll just hard-code them
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    
    [self textLayer].wrapped = YES;
    [self.layer display];
}





@end
