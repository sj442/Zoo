//
//  CustomCAKeyFrameAnimation.h
//  Zoo
//
//  Created by Sunayna Jain on 1/17/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CustomCAKeyFrameAnimation : CAKeyframeAnimation

+ (void) animationKeyFramed: (CALayer *) layer
                   delegate: (id) object
                     forKey: (NSString *) key;

@end
