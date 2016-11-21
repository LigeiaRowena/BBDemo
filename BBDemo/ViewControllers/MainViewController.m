//
//  MainViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"


#import "AFNetworkingManager.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end


@implementation MainViewController


#pragma mark - Init/Launch ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // getMembers request
    [AFNetworkingManager getMembers:^(NSDictionary *members, NSError *error) {
        if (!error && isEmptyObject(members)) {
            
        } else {
            //TODO: show alert
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UICollectionViewDataSource/UICollectionViewDelegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setContent:@"test"];
    // [cell setThumbWithData:diagnosticImage.image];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:showDetailSegue sender:nil];
}


@end
