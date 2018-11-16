//
//  DYSDemo11ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/16.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo11ViewController.h"

@interface DYSDemo11ViewController ()
@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@end

@implementation DYSDemo11ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)yyi_route1 {
    
    [UIView animateWithDuration:2 animations:^{
        CATransform3D outerTransform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        self.outerView.layer.transform = outerTransform;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            CATransform3D innerTransform = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
            self.innerView.layer.transform = innerTransform;
        }];
    }];
}

- (void)yyi_route2 {

    [UIView animateWithDuration:2 animations:^{
        
        CATransform3D outerTransform = CATransform3DIdentity;
        outerTransform.m34 = -1.0/500.0;
        outerTransform = CATransform3DRotate(outerTransform, M_PI_4, 0, 1, 0);
        self.outerView.layer.transform = outerTransform;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:2 animations:^{
            CATransform3D innerTransform = CATransform3DIdentity;
            innerTransform.m34 =  -1.0/500.0;
            innerTransform = CATransform3DRotate(innerTransform, -M_PI_4, 0, 1, 0);
            self.innerView.layer.transform = innerTransform;
        }];
        
    }];
    
}


- (IBAction)segmentClick:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if (control.selectedSegmentIndex == 0) {
        self.outerView.layer.transform = CATransform3DIdentity;
        self.innerView.layer.transform = CATransform3DIdentity;
    }
    else if (control.selectedSegmentIndex == 1) {
        [self yyi_route1];
    }
    else if (control.selectedSegmentIndex == 2) {
        [self yyi_route2];
    }
    
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
