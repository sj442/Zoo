//
//  CustomCAKeyFrameAnimation.m
//  Zoo
//
//  Created by Sunayna Jain on 1/17/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

#import "CustomCAKeyFrameAnimation.h"

@implementation CustomCAKeyFrameAnimation

+ (void) animationKeyFramed: (CALayer *) layer
                   delegate: (id) object
                     forKey: (NSString *) key {
    
    CAKeyframeAnimation *animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:key];
    animation.duration = 0.4;
    animation.cumulative = YES;
    animation.repeatCount = 2;
    CGFloat wobbleAngle = 0.0872664626f;
    NSValue *initial = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)];
    NSValue *middle = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(wobbleAngle, 0.0f, 0.0f, 1.0f)];
    NSValue *final = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-wobbleAngle, 0.0f, 0.0f, 1.0f)];
    animation.values = [NSArray arrayWithObjects:initial, middle, final, nil];

    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.removedOnCompletion = NO;
    animation.delegate = object;
    
    [layer addAnimation:animation forKey:key];
}


@end
