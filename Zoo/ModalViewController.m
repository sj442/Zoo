//
//  ModalViewController.m
//  Zoo
//
//  Created by Sunayna Jain on 1/16/14.
//  Copyright (c) 2014 LittleAuk. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    }

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"modal view did appear called");
    
    [self.containerView removeFromSuperview];
    
    [self PortraitOrientationLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)cancelButtonTapped:(id)sender{
    NSLog(@"cancel button tapped");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillLayoutSubviews{
    
    NSLog(@"modal view will layout subviews called");
    
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])){
        [self LandscapeOrientationLayout];
    } else {
        [self PortraitOrientationLayout];
    }
}

-(void)LandscapeOrientationLayout{
    
    [self.containerView removeFromSuperview];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    //self.containerView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.containerView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(500, 30, 30, 30)];
    [button setImage:[UIImage imageNamed:@"cross.jpeg"] forState:UIControlStateNormal];
    //button.backgroundColor = [UIColor lightGrayColor];
    
    [button addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(250, 20, 200, 60)];
    name.text = self.animalName;
    name.font = [UIFont fontWithName:@"Chalkduster" size:30];
    name.textColor = [UIColor blueColor];
    //name.backgroundColor = [UIColor redColor];
    
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 350, 290)];
    descriptionLabel.text = self.description;
    descriptionLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
    descriptionLabel.numberOfLines = 0;
    //descriptionLabel.backgroundColor = [UIColor blueColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(400, 150, 100, 100)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.image]];
    
    //imageView.backgroundColor = [UIColor lightGrayColor];
    
    [self.containerView addSubview:name];
    [self.containerView addSubview:descriptionLabel];
    [self.containerView addSubview:button];
    [self.containerView addSubview:imageView];
}

-(void)PortraitOrientationLayout{
    
    [self.containerView removeFromSuperview];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    //self.containerView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.containerView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(280, 30, 30, 30)];
    [button setImage:[UIImage imageNamed:@"cross.jpeg"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(100, 20, 200, 60)];
    name.text = self.animalName;
    name.font = [UIFont fontWithName:@"Chalkduster" size:30];
    name.textColor = [UIColor blueColor];
    
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 280, 290)];
    descriptionLabel.text = self.description;
    descriptionLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
    descriptionLabel.numberOfLines = 0;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 350, 100, 100)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.image]];
    
    [self.containerView addSubview:name];
    [self.containerView addSubview:descriptionLabel];
    [self.containerView addSubview:button];
    [self.containerView addSubview:imageView];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.containerView removeFromSuperview];
}

@end
