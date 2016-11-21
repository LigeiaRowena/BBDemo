//
//  MainCollectionViewCell.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainCollectionViewCell.h"


@interface MainCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end


@implementation MainCollectionViewCell


- (void)setContent:(id)content {
    self.nameLabel.text = content;
}


@end
