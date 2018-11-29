//
//  DYSDemo26ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/29.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo26ViewController.h"
#import "DYSDemo26ScrollLayerView.h"

@interface DYSDemo26ViewController ()
@property (weak, nonatomic) IBOutlet DYSDemo26ScrollLayerView *scrollLayerView;

@end

@implementation DYSDemo26ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby"]];
//    imageView.frame = CGRectMake(0, 0, self.scrollLayerView.frame.size.width * 2, self.scrollLayerView.frame.size.height * 2);
//    [self.scrollLayerView addSubview:imageView];
    
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
