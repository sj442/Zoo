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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//
//   self.containerView.backgroundColor = [UIColor yellowColor];
//   [self.view addSubview:self.containerView];
    
    [[DataStore sharedDataStore]animalData];
    
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    
//    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])){
//            array = [self animalViewsLayoutForLandscape];
//            } else {
//            array = [self animalViewsLayoutForPortrait];
//            }
//    [self createAnimalObjectsInImageViewArray:array];
}

-(void)handlePan:(CustomPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.containerView];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}

-(void)handleTap:(UITapGestureRecognizer*)recognizer{
    recognizer.numberOfTapsRequired = 1;
    NSLog(@"handle tap called");
    //if (recognizer.state == UIGestureRecognizerStateEnded){
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.animalName = ((AnimalImageView*)recognizer.view).animalName;
    NSLog(@"modal animal name trasferred %@", modal.animalName);
    modal.description = ((AnimalImageView*)recognizer.view).description;
    modal.funfacts = ((AnimalImageView*)recognizer.view).funfacts;
    modal.image = ((AnimalImageView*)recognizer.view).imageName;
    [self presentViewController:modal animated:YES completion:nil];
   // }
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
    [UIView setAnimationDuration:0.05];
    [UIView setAnimationDelegate:self];
    recognizer.view.transform = rightWobble;
    recognizer.view.transform = neutral; //endpoint
    [UIView commitAnimations];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"phone shake happened");
        for (AnimalImageView *imageView in self.containerView.subviews){
            CustomPanGestureRecognizer *recognizer = ((CustomPanGestureRecognizer*)imageView.gestureRecognizers[2]);
            [UIView animateWithDuration:0.25 animations:^{
                recognizer.view.center = recognizer.originalCenter;
            }];
        }
    }
}

-(void)createAnimalObjectsInImageViewArray:(NSArray*)array{
    
    DataStore *instance = [DataStore sharedDataStore];
    
    NSArray *animalNames = [[NSArray alloc]initWithArray:instance.animalNames];
    
    NSArray *animalDescriptions= [[NSArray alloc]initWithArray:instance.descriptions];

    NSArray *animalFunfacts = [[NSArray alloc]initWithArray:instance.funfacts];
    
    NSArray *animalImagesnames = [[NSArray alloc]initWithArray:instance.imageNames];
    
    for (int k=0; k<12; k++){
        Animal *animal = [[Animal alloc]initWithName:animalNames[k] description:animalDescriptions[k] funfacts:animalFunfacts[k] image:animalImagesnames[k]];
        ((AnimalImageView*)array[k]).image = [UIImage imageNamed:animalImagesnames[k]];
        animal.animalImageview = array[k];
        [animal.animalImageview setUserInteractionEnabled:YES];
        
        self.pangesture = [[CustomPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
        self.pangesture.delegate = self;
        tap.delegate = self;
        longPress.delegate = self;
        [animal.animalImageview addGestureRecognizer:tap];
        [animal.animalImageview addGestureRecognizer:longPress];
        [animal.animalImageview addGestureRecognizer:self.pangesture];
        ((CustomPanGestureRecognizer*)animal.animalImageview.gestureRecognizers[2]).originalCenter = animal.animalImageview.center;
        
        animal.animalImageview.animalName = animalNames[k];
        animal.animalImageview.description = animalDescriptions[k];
        animal.animalImageview.funfacts = animalFunfacts[k];
        animal.animalImageview.imageName = animalImagesnames[k];

        [self.containerView addSubview:animal.animalImageview];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 }

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"view will appear called");
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.containerView removeFromSuperview];
    
    [self animalViewsLayoutForPortrait];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.containerView removeFromSuperview];

}

#pragma mark-methods for orientation change

-(void)viewWillLayoutSubviews{
    
    NSLog(@"view will layout subviews called");
    
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])){
        
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[self animalViewsLayoutForLandscape]];
        
        [self createAnimalObjectsInImageViewArray:array];
    }
     else
    {
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[self animalViewsLayoutForPortrait]];
        
        [self createAnimalObjectsInImageViewArray:array];
        }
}

-(NSMutableArray*)animalViewsLayoutForLandscape{
    
    [self.containerView removeFromSuperview];
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    //self.containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];

    for (int i=0; i<4; i++){
        for (int j=0; j<3; j++){
            AnimalImageView *imageView = [[AnimalImageView alloc]initWithFrame:CGRectMake(100*i+80, 100*j+20, 80, 80)];
            [array addObject:imageView];
        }
    }
    return  array;
}

-(NSMutableArray*)animalViewsLayoutForPortrait{
    
    [self.containerView removeFromSuperview];
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //self.containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    for (int i=0; i<3; i++){
        for (int j=0; j<4; j++){
            AnimalImageView *imageView = [[AnimalImageView alloc]initWithFrame:CGRectMake(100*i+20, 100*j+100, 80, 80)];
            [array addObject:imageView];
        }
    }
    return array;
}


@end
