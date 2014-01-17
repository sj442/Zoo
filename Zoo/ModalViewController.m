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
    }

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(280, 30, 30, 30)];
    [button setImage:[UIImage imageNamed:@"cross.jpeg"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(cancelButtonTapped:)   forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(130, 20, 150, 60)];
    name.text = self.animalName;
    name.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 280, 250)];
    descriptionLabel.text = self.description;
    descriptionLabel.numberOfLines = 0;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 250, 100, 100)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.image]];
    
    [self.view addSubview:name];
    [self.view addSubview:descriptionLabel];
    [self.view addSubview:button];
    [self.view addSubview:imageView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)cancelButtonTapped:(id)sender{
    NSLog(@"cancel button tapped");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
