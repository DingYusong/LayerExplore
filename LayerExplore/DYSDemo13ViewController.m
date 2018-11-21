//
//  DYSDemo13ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo13ViewController.h"
#import "DYSDemo13WeakTimerProxy.h"

@interface DYSDemo13ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *hourHand;
@property (nonatomic, weak) IBOutlet UIImageView *minuteHand;
@property (nonatomic, weak) IBOutlet UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;


@end

@implementation DYSDemo13ViewController

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



- (void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    //calculate hour hand angle //calculate minute hand angle
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    //calculate second hand angle
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    //rotate hands
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
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
