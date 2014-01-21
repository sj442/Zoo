//
//  MainViewController.h
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Animal.h"
#import "DataStore.h"
#import "ModalViewController.h"
#import "AnimalImageView.h"
#import "CustomPanGestureRecognizer.h"
#import <CoreText/CoreText.h>


@interface MainViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong,nonatomic) CustomPanGestureRecognizer *pangesture;
@property (strong, nonatomic) NSArray *imageViewArray;
@property (strong, nonatomic) UIView *containerView;

    
@end
