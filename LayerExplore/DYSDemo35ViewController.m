//
//  DYSDemo35ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/12/6.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo35ViewController.h"
#import "DYSDemo13WeakTimerProxy.h"

@interface DYSDemo35ViewController () <CAAnimationDelegate>
@property (nonatomic, weak) IBOutlet UIImageView *hourHand;
@property (nonatomic, weak) IBOutlet UIImageView *minuteHand;
@property (nonatomic, weak) IBOutlet UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;

@end

/**
 和CABasicAnimation类似，CAKeyframeAnimation同样是CAPropertyAnimation的一个子类，它依然作用于单一的一个属性，但是和CABasicAnimation不一样的是，它不限制于设置一个起始和结束的值，而是可以根据一连串随意的值来做动画。
 */
@implementation DYSDemo35ViewController

- (void)dealloc {
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.hourHand.layer.anchorPoint = CGPointMake(0.5, 0.8);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.8);
    self.secondHand.layer.anchorPoint = CGPointMake(0.5, 0.8);
    
    DYSDemo13WeakTimerProxy *proxy = [[DYSDemo13WeakTimerProxy alloc] initWithTarget:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:proxy selector:@selector(tick) userInfo:nil repeats:YES];
    //set initial hand positions
    [self tick];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)tick {
    [self updateHandsAnimated:YES];
}

- (void)updateHandsAnimated:(BOOL)animated {
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    [self setAngle:hoursAngle handleView:self.hourHand animated:animated];
    [self setAngle:minsAngle handleView:self.minuteHand animated:animated];
    [self setAngle:secsAngle handleView:self.secondHand animated:animated];
}

- (void)setAngle:(CGFloat)angle handleView:(UIView *)handView animated:(BOOL)animated {
    if (animated) {
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DMakeRotation(angle, 0, 0, 1);

        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"transform";
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.delegate = self;
        [handView.layer addAnimation:animation forKey:@"handView"];
    }
    else {
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DMakeRotation(angle, 0, 0, 1);
        handView.layer.transform = transform;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CABasicAnimation *animation = (CABasicAnimation *)anim;
    UIView *handView = [animation valueForKey:@"handView"];
    handView.layer.transform = [animation.toValue CATransform3DValue];
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
