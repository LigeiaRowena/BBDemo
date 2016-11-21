//
//  MainCollectionViewCell.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "Employee.h"
#import "UIImageView+Utility.h"


@interface MainCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end


@implementation MainCollectionViewCell


#pragma mark - Init/Launch CollectionCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    //self.backgroundColor = [UIColor blackColor];
    [self.layer setBorderColor:[[UIColor redColor] CGColor]];
    [self.layer setBorderWidth:1.0f];
    [self.layer setCornerRadius:5.0f];
    [self setClipsToBounds:YES];
}


#pragma mark - Public


- (void)setContent:(id)content {
    Employee *employee = (Employee *)content;
    self.nameLabel.text = employee.fullName;
    [self.imageView setImageWithFileName:employee.photo];
}


@end
