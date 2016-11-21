//
//  DetailViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+Utility.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *roleLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@end


@implementation DetailViewController


#pragma mark - Init/Launch ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.imageView setImageWithFileName:self.employee.photo];
    self.fullNameLabel.text = [NSString stringWithFormat:@"Full name: %@", self.employee.fullName];
    self.departmentLabel.text = [NSString stringWithFormat:@"Department: %@", self.employee.department];
    self.roleLabel.text = [NSString stringWithFormat:@"Role: %@", self.employee.role];
    self.emailLabel.text = [NSString stringWithFormat:@"Email: %@", self.employee.email];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
