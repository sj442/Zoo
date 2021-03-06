//
//  ModalViewController.h
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController

@property (strong, nonatomic) NSString *animalName;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *funfacts;
@property (strong, nonatomic) NSString *image;

@property (strong, nonatomic) UIView *containerView;

@end
