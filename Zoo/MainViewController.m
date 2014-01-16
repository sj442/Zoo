//
//  MainViewController.m
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[DataStore sharedDataStore]animalData];
    [self createAnimalObjects];
}

-(void)handlePan:(UIPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

-(void)createAnimalObjects{
    
    DataStore *instance = [DataStore sharedDataStore];
    NSArray *animalNames = [[NSArray alloc]initWithArray:instance.animalNames];
    NSArray *animalDescriptions = [[NSArray alloc]initWithArray:instance.descriptions];
    NSArray *animalFunfacts = [[NSArray alloc]initWithArray:instance.funfacts];
    NSArray *animalImagesnames = [[NSArray alloc]initWithArray:instance.imageNames];
    
    for (int i=0; i<3; i++){
        for (int j=0; j<4; j++){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100*i+20, 100*j+70, 80, 80)];
            imageView.image = [UIImage imageNamed:animalImagesnames[(i+1)*j]];
            [imageView setUserInteractionEnabled:YES];
            UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            recognizer.delegate = self;
            [imageView addGestureRecognizer:recognizer];
            Animal *animal = [[Animal alloc]initWithName:animalNames[(i+1)*j] description:animalDescriptions[(i+1)*j] funfacts:animalFunfacts[(i+1)*j] image:animalImagesnames[(i+1)*j] andimageview:imageView];
            [self.view addSubview:imageView];
        }
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
