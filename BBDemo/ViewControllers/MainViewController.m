//
//  MainViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"
#import "Employee.h"
#import "MainCollectionViewLayout.h"


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *data;
@end


@implementation MainViewController


#pragma mark - Init/Launch ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init 
    self.data = @[].mutableCopy;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    // getMembers request
    [AFNetworkingManager getMembers:^(NSArray *members, NSError *error) {
        if (!error && !isEmptyObject(members)) {
            self.data = members.mutableCopy;
            [self.collectionView reloadData];
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
    return [self.data count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSDictionary *membersSortedDict = self.data[section];
    NSString *department = [[membersSortedDict allKeys] firstObject];
    return [membersSortedDict[department] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSDictionary *membersSortedDict = self.data[indexPath.section];
    NSString *department = [[membersSortedDict allKeys] firstObject];
    NSArray *members = membersSortedDict[department];
    Employee *employee = members[indexPath.row];    
    [cell setContent:employee];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:showDetailSegue sender:nil];
}


@end
