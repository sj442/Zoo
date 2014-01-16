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
    self.title = @"ZOO";
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

-(void)handleDoubleTap:(UITapGestureRecognizer*)recognizer{
    recognizer.numberOfTapsRequired = 2;
    
}


-(void)handleTap:(UITapGestureRecognizer*)recognizer{
    
    NSLog(@"handle tap called");
    
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.animalName = ((AnimalImageView*)recognizer.view).animalName;
    NSLog(@"modal animal name trasferred %@", modal.animalName);
    modal.description = ((AnimalImageView*)recognizer.view).description;
    modal.funfacts = ((AnimalImageView*)recognizer.view).funfacts;
    [self presentViewController:modal animated:YES completion:^{
        NSLog(@"tap action");
        
    }];
    
}

-(void)createAnimalObjects{
    
    DataStore *instance = [DataStore sharedDataStore];
    NSArray *animalNames = [[NSArray alloc]initWithArray:instance.animalNames];
    NSArray *animalDescriptions = [[NSArray alloc]initWithArray:instance.descriptions];
    NSArray *animalFunfacts = [[NSArray alloc]initWithArray:instance.funfacts];
    NSArray *animalImagesnames = [[NSArray alloc]initWithArray:instance.imageNames];
    
    for (int i=0; i<3; i++){
        for (int j=0; j<4; j++){
            AnimalImageView *imageView = [[AnimalImageView alloc]initWithFrame:CGRectMake(100*i+20, 100*j+70, 80, 80)];
            imageView.image = [UIImage imageNamed:animalImagesnames[(i+1)*j]];
            [imageView setUserInteractionEnabled:YES];
            UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
            UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
            recognizer.delegate = self;
            tap.delegate = self;
            doubleTap.delegate = self;
            [imageView addGestureRecognizer:tap];
            [imageView addGestureRecognizer:doubleTap];
            [imageView addGestureRecognizer:recognizer];
            
            imageView.animalName = animalNames[(i+1)*j];
            imageView.description = animalDescriptions[(i+1)*j];
            imageView.funfacts = animalFunfacts[(i+1)*j];
            
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
