//
//  Animal.m
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(Animal*)initWithName:(NSString*)name description:(NSString*)description funfacts:(NSString*)funfacts image:(UIImage*)image{
    self = [super init];
    if (self){
        self.name = name;
        self.description = description;
        self.funFacts = funfacts;
        self.animalImage = image;
    }
    return self;
}

@end
