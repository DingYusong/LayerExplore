//
//  DYSDemo39ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/6.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo39ViewController.h"

@interface DYSDemo39ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, copy) NSArray *imagesArray;
@property (nonatomic, strong) UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *layerView2;
@property (nonatomic, copy) NSArray *labelArray;
@property (nonatomic, strong) UILabel *label;
@end

@implementation DYSDemo39ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imagesArray = @[[UIImage imageNamed:@"beauty"],[UIImage imageNamed:@"baby"],[UIImage imageNamed:@"dog.jpg"],];
    
    UIImage *nextImage = [self.imagesArray objectAtIndex:0];
//    self.layerView.layer.contents = (__bridge id)nextImage.CGImage;

    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:nextImage];
    imageView.frame = self.layerView.bounds;
    [self.layerView addSubview:imageView];
    self.imageView = imageView;
    
    
    
    
    self.labelArray = @[@"1111111",
                        @"1111112",
                        @"1111113",
                        @"1111114",
                        @"1111115",
                        @"1111116",];

    
    UILabel *label = [[UILabel alloc] initWithFrame:self.layerView2.bounds];
    label.text = self.labelArray[0];
    label.textColor = [UIColor blackColor];
    [self.layerView2 addSubview:label];
    self.label = label;
}
- (IBAction)btnClick:(id)sender {
    
//    CGImageRef imageRef = (__bridge CGImageRef)self.layerView.layer.contents;
//    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    UIImage *image = self.imageView.image;
    
    
    NSInteger index = [self.imagesArray indexOfObject:image];
    NSInteger next = (index+1)%self.imagesArray.count;
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    
    UIImage *nextImage = [self.imagesArray objectAtIndex:next];
    
    
//    self.layerView.layer.contents = (__bridge id)nextImage.CGImage;
    self.imageView.image = nextImage;
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    
    self.label.text = self.labelArray[next];
    [self.label.layer addAnimation:transition forKey:nil];

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
