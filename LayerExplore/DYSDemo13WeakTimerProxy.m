//
//  DYSDemo13WeakTimerProxy.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/21.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo13WeakTimerProxy.h"

@interface DYSDemo13WeakTimerProxy ()

@property (nonatomic, weak) id target;

@end

@implementation DYSDemo13WeakTimerProxy

- (instancetype)initWithTarget:(id)target {
    self.target = target;
    return self;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}



@end
