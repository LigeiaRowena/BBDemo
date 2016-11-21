//
//  MainCollectionViewLayout.m
//  BBDemo
//
//  Created by Francesca Corsini on 21/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainCollectionViewLayout.h"


@implementation MainCollectionViewLayout


#pragma mark - Init/Launch CollectionViewLayout


- (id)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    
    // iPad layout
    if (iPad()) {
        int space = 10;
        self.itemSize = CGSizeMake(150, 150);
        self.minimumInteritemSpacing = space/2;
        self.minimumLineSpacing = space;
        self.sectionInset = UIEdgeInsetsMake(space, space, space, space);
        
    // iPhone layout
    } else if (iPhone()) {
        int space = 3;
        self.itemSize = CGSizeMake(150, 150);
        self.minimumInteritemSpacing = space/2;
        self.minimumLineSpacing = space;
        self.sectionInset = UIEdgeInsetsMake(space, space, space, space);
    }
}


@end
