//
//  DataStore.m
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (DataStore *)sharedDataStore {
    static DataStore *sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataStore = [[self alloc] init];
    });
    return sharedDataStore;
}


-(void)animalData{

    self.animalNames = [[NSArray alloc]initWithObjects:@"zebra", @"rat", @"cat", @"giraffe", @"dog", @"tiger", @"koala", @"camel", @"horse", @"kangaroo", @"deer", @"elephant", nil];
    
    self.descriptions = [[NSArray alloc]initWithObjects:@"zebra", @"rat", @"cat", @"giraffe", @"dog", @"tiger", @"koala", @"camel", @"horse", @"kangaroo", @"deer", @"elephant", nil];
    
    self.funfacts = [[NSArray alloc]initWithObjects:@"zebra", @"rat", @"cat", @"giraffe", @"dog", @"tiger", @"koala", @"camel", @"horse", @"kangaroo", @"deer", @"elephant", nil];
    
    self.imageNames = [[NSArray alloc]initWithObjects:@"zebra.jpg", @"rat.png", @"cat.jpeg", @"giraffe.jpg",@"dog.jpeg", @"tiger.jpeg", @"koala1.jpeg", @"camel.jpeg", @"horse.jpeg", @"kangaoo.jpg", @"deer.jpeg", @"elephant.jpeg", nil];
    
}

@end
