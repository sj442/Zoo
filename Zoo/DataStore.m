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

    self.animalNames = [[NSArray alloc]initWithObjects:@"Zebra", @"Rat", @"Cat", @"Giraffe", @"Dog", @"Tiger", @"Koala Bear", @"Camel", @"Horse", @"Kangaroo", @"Deer", @"Elephant", nil];
    
    //self.animalNames1 = [[NSArray alloc]initWithObjects:@"dog", @"tiger", @"koala", @"camel", nil];
    
    //self.animalNames2 = [[NSArray alloc]initWithObjects:@"horse", @"kangaroo", @"deer", @"elephant", nil];
    
    self.descriptions = [[NSArray alloc]initWithObjects:@"Zebra are part of the equidae family along with horse and donkeys.", @"A group of rats is called “pack,” “swarm,” or “mischief.It is possible that a male rat and a female rat can have over one million descendents in less than two years.", @"There are more than 500 million domestic cats in the world, with approximately 40 recognized breeds.", @"The giraffe is an African even-toed ungulate mammal, the tallest living terrestrial animal and the largest ruminant. Its species name refers to its camel-like appearance and the patches of color on its fur.", @"The domestic dog is a subspecies of the gray wolf, a member of the Canidae family of the mammalian order Carnivora." , @"The tiger is the largest cat species, reaching a total body length of up to 3.3 m and weighing up to 306 kg. Its most recognizable feature is a pattern of dark vertical stripes on reddish-orange fur with a lighter underside.", @"The koala is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae, and its closest living relatives are the wombats.",@"A camel is an even-toed ungulate within the genus Camelus, bearing distinctive fatty deposits known as humps on its back.", @"The horse is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae.", @"The kangaroo is a marsupial from the family Macropodidae (macropods, meaning 'large foot').Kangaroos are endemic to Australia.", @"Deer are the ruminant mammals that comprise the family Cervidae. Species include white-tailed deer, such mule deer as black-tailed deer, elk, moose, red deer, reindeer (caribou) fallow deer, roe deer, pudú and chital.", @"Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant and the Asian elephant", nil];
    
    self.funfacts = [[NSArray alloc]initWithObjects:@"Zebra are part of the equidae family along with horse and donkeys.", @"A group of rats is called “pack,” “swarm,” or “mischief.It is possible that a male rat and a female rat can have over one million descendents in less than two years.", @"There are more than 500 million domestic cats in the world, with approximately 40 recognized breeds.", @"The giraffe is an African even-toed ungulate mammal, the tallest living terrestrial animal and the largest ruminant. Its species name refers to its camel-like appearance and the patches of color on its fur.", @"The domestic dog is a subspecies of the gray wolf, a member of the Canidae family of the mammalian order Carnivora." , @"The tiger is the largest cat species, reaching a total body length of up to 3.3 m and weighing up to 306 kg. Its most recognizable feature is a pattern of dark vertical stripes on reddish-orange fur with a lighter underside.", @"The koala is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae, and its closest living relatives are the wombats.",@"A camel is an even-toed ungulate within the genus Camelus, bearing distinctive fatty deposits known as humps on its back.", @"The horse is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae.", @"The kangaroo is a marsupial from the family Macropodidae (macropods, meaning 'large foot').Kangaroos are endemic to Australia.", @"Deer are the ruminant mammals that comprise the family Cervidae. Species include white-tailed deer, such mule deer as black-tailed deer, elk, moose, red deer, reindeer (caribou) fallow deer, roe deer, pudú and chital.", @"Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant and the Asian elephant", nil];

    
    //self.descriptions1 = [[NSArray alloc]initWithObjects:@"The domestic dog is a subspecies of the gray wolf, a member of the Canidae family of the mammalian order Carnivora." , @"The tiger is the largest cat species, reaching a total body length of up to 3.3 m and weighing up to 306 kg. Its most recognizable feature is a pattern of dark vertical stripes on reddish-orange fur with a lighter underside.", @"The koala is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae, and its closest living relatives are the wombats.",@"A camel is an even-toed ungulate within the genus Camelus, bearing distinctive fatty deposits known as humps on its back.", nil];
    
    //self.descriptions2 = [[NSArray alloc]initWithObjects:@"The horse is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae.", @"The kangaroo is a marsupial from the family Macropodidae (macropods, meaning 'large foot').Kangaroos are endemic to Australia.", @"Deer are the ruminant mammals that comprise the family Cervidae. Species include white-tailed deer, such mule deer as black-tailed deer, elk, moose, red deer, reindeer (caribou) fallow deer, roe deer, pudú and chital.", @"Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant and the Asian elephant",nil];
    
    
//    self.funfacts = [[NSArray alloc]initWithObjects:@"Zebra are part of the equidae family along with horse and donkeys.", @"A group of rats is called “pack,” “swarm,” or “mischief.It is possible that a male rat and a female rat can have over one million descendents in less than two years.", @"There are more than 500 million domestic cats in the world, with approximately 40 recognized breeds.", @"The giraffe is an African even-toed ungulate mammal, the tallest living terrestrial animal and the largest ruminant. Its species name refers to its camel-like appearance and the patches of color on its fur.", nil];
//    
//    self.funfacts1 = [[NSArray alloc]initWithObjects:@"The domestic dog is a subspecies of the gray wolf, a member of the Canidae family of the mammalian order Carnivora." , @"The tiger is the largest cat species, reaching a total body length of up to 3.3 m and weighing up to 306 kg. Its most recognizable feature is a pattern of dark vertical stripes on reddish-orange fur with a lighter underside.", @"The koala is an arboreal herbivorous marsupial native to Australia. It is the only extant representative of the family Phascolarctidae, and its closest living relatives are the wombats.",@"A camel is an even-toed ungulate within the genus Camelus, bearing distinctive fatty deposits known as humps on its back.", nil];
//    
//    self.funfacts2 = [[NSArray alloc]initWithObjects:@"The horse is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae.", @"The kangaroo is a marsupial from the family Macropodidae (macropods, meaning 'large foot').Kangaroos are endemic to Australia.", @"Deer are the ruminant mammals that comprise the family Cervidae. Species include white-tailed deer, such mule deer as black-tailed deer, elk, moose, red deer, reindeer (caribou) fallow deer, roe deer, pudú and chital.", @"Elephants are large mammals of the family Elephantidae and the order Proboscidea. Traditionally, two species are recognised, the African elephant and the Asian elephant",nil];
    
    self.imageNames = [[NSArray alloc]initWithObjects:@"zebra.jpg", @"rat.png", @"cat.jpeg", @"giraffe.jpg", @"dog.jpeg", @"tiger.jpeg", @"koala1.jpeg", @"camel.jpeg", @"horse.jpeg", @"kangaroo.jpg", @"deer.jpeg", @"elephant.jpeg", nil];
    
    //self.imageNames1 = [[NSArray alloc]initWithObjects:@"dog.jpeg", @"tiger.jpeg", @"koala1.jpeg", @"camel.jpeg", nil];

    //self.imageNames2 = [[NSArray alloc]initWithObjects:@"horse.jpeg", @"kangaoo.jpg", @"deer.jpeg", @"elephant.jpeg", nil];
    
}

@end
