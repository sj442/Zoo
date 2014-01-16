//
//  Animal.h
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSArray *funFacts;
@property (strong, nonatomic) UIImage *animalImage;
@property (strong, nonatomic) UIImageView *animalImageview;

@end
