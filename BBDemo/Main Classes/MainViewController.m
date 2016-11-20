//
//  MainViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)goToDetail:(id)sender {
    [self performSegueWithIdentifier:showDetailSegue sender:sender];
}

@end
