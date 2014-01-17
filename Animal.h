//
//  Animal.h
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimalImageView.h"

@interface Animal : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *funFacts;
@property (strong, nonatomic) UIImage *animalImage;
@property (strong, nonatomic) AnimalImageView *animalImageview;

-(Animal*)initWithName:(NSString*)name description:(NSString*)description funfacts:(NSString*)funfacts image:(UIImage*)image;

@end
