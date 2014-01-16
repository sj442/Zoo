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
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(280, 30, 30, 30)];
    [button setImage:[UIImage imageNamed:@"cross.jpeg"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(cancelButtonTapped:)   forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
    name.text = self.animalName;
    [self.view addSubview:name];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

-(void)cancelButtonTapped:(id)sender{
    NSLog(@"cancel button tapped");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
