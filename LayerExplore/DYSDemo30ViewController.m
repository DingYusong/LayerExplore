//
//  DYSDemo30ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/30.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo30ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DYSDemo30ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation DYSDemo30ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSString *playerPath = [[NSBundle mainBundle] pathForResource:@"mybaby" ofType:@"mp4"];
//    NSURL *playUrl = [NSURL URLWithString:playerPath];
    
//    NSURL *playUrl = [[NSBundle mainBundle] URLForResource:@"mybaby" withExtension:@"MP4"];
//    AVPlayer *player = [AVPlayer playerWithURL:playUrl];
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//    
//    playerLayer.frame = self.containerView.bounds;
//    [self.containerView.layer addSublayer:playerLayer];
//    
//    [player play];
    
    
    
    
    //get video URL
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Ship"
                                         withExtension:@"mp4"];
    
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
    
    //play the video
    [player play];

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
