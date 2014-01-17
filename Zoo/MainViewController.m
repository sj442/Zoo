//
//  MainViewController.m
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "MainViewController.h"

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

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

-(void)handlePan:(CustomPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}


-(void)handleTap:(UITapGestureRecognizer*)recognizer{
    recognizer.numberOfTapsRequired = 1;
    NSLog(@"handle tap called");
    if (recognizer.state == UIGestureRecognizerStateEnded){
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.animalName = ((AnimalImageView*)recognizer.view).animalName;
    NSLog(@"modal animal name trasferred %@", modal.animalName);
    modal.description = ((AnimalImageView*)recognizer.view).description;
    modal.funfacts = ((AnimalImageView*)recognizer.view).funfacts;
    [self presentViewController:modal animated:YES completion:nil];
    }
}

-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer{
    NSLog(@"long press action");
    CGAffineTransform leftWobble = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-15.0));
    CGAffineTransform rightWobble = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(15.0));
    CGAffineTransform neutral = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(0.0));
    
    recognizer.view.transform = leftWobble;  // starting point
    
    [UIView beginAnimations:@"wobble" context:(__bridge void *)(recognizer.view)];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:3];
    [UIView setAnimationDuration:0.100];
    [UIView setAnimationDelegate:self];
    recognizer.view.transform = rightWobble;
    recognizer.view.transform = neutral; //endpoint
    [UIView commitAnimations];
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
            
            self.layer = [[CALayer alloc]initWithLayer:imageView];
            self.pangesture = [[CustomPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
            self.pangesture.delegate = self;
            tap.delegate = self;
            longPress.delegate = self;
            [imageView addGestureRecognizer:tap];
            [imageView addGestureRecognizer:longPress];
            [imageView addGestureRecognizer:self.pangesture];
            ((CustomPanGestureRecognizer*)imageView.gestureRecognizers[2]).originalCenter = imageView.center;
            
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
 }



-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"phone shake happened");
        for (AnimalImageView *imageView in self.view.subviews){
            NSLog(@"%@", [imageView.gestureRecognizers[2] description]);
            CustomPanGestureRecognizer *recognizer = ((CustomPanGestureRecognizer*)imageView.gestureRecognizers[2]);
            
            [UIView animateWithDuration:0.25 animations:^{
                recognizer.view.center = recognizer.originalCenter;
                            }];
        }
    }
}



@end
