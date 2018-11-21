//
//  DYSDemo19ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo19ViewController.h"

@interface DYSDemo19ViewController ()
@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *digitViews;
@property (nonatomic, weak) NSTimer *timer;



@end

@implementation DYSDemo19ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage *digits = [UIImage imageNamed:@"Digits.png"];
    
    //set up digit views
    for (UIView *view in self.digitViews) {
        //set contents
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        view.layer.contentsGravity = kCAGravityResizeAspect;
    }
    
    //start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    //set initial clock time
    [self tick];

}
- (void)setDigit:(NSInteger)digit forView:(UIView *)view
{
    //adjust contentsRect to select correct digit
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
}

- (void)tick
{
    //convert time to hours, minutes and seconds
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
//    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;￼
//
//    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];

    
    //set hours
    [self setDigit:components.hour / 10 forView:self.digitViews[0]];
    [self setDigit:components.hour % 10 forView:self.digitViews[1]];
    
    //set minutes
    [self setDigit:components.minute / 10 forView:self.digitViews[2]];
    [self setDigit:components.minute % 10 forView:self.digitViews[3]];
    
    //set seconds
    [self setDigit:components.second / 10 forView:self.digitViews[4]];
    [self setDigit:components.second % 10 forView:self.digitViews[5]];
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
