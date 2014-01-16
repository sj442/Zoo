//
//  DataStore.h
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *imageNames;
@property (strong, nonatomic) NSArray *descriptions;
@property (strong, nonatomic) NSArray *funfacts;
@property (strong, nonatomic) NSArray *imageViews;


+(DataStore*)sharedDataStore;

-(void)animalData;

@end
