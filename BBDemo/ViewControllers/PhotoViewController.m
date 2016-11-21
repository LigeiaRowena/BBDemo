//
//  PhotoViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 21/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "PhotoViewController.h"


@interface PhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end


@implementation PhotoViewController


#pragma mark - Init/Launch ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.imageView setImageWithFileName:self.photo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
