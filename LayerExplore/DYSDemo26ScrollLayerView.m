//
//  DYSDemo26ScrollLayerView.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/29.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo26ScrollLayerView.h"

@implementation DYSDemo26ScrollLayerView

+ (Class)layerClass {
    return [CAScrollLayer class];
}


- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self yyi_init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self yyi_init];
    }
    return self;
}

- (void)yyi_init {
    self.layer.masksToBounds = YES;
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    [recognizer setTranslation:CGPointZero inView:self];    
}



@end
