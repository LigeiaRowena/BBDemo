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
#import "MainCollectionHeader.h"
#import "DetailViewController.h"


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
    
    UINib *cellNibHeader = [UINib nibWithNibName:@"MainCollectionHeader" bundle:nil];
    [self.collectionView registerNib:cellNibHeader forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    // getMembers request
    [AFNetworkingManager getMembers:^(NSArray *members, NSError *error) {
        if (!error && !isEmptyObject(members)) {
            self.data = members.mutableCopy;
            [self.collectionView reloadData];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Unable to reach network" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:alertAction];
            alertController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:showDetailSegue]) {
        DetailViewController *destination = (DetailViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
        Employee *employee = [self getEmployeeFromIndexPath:indexPath];
        destination.employee = employee;
    }
}


#pragma mark - Private


- (Employee *)getEmployeeFromIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *membersSortedDict = self.data[indexPath.section];
    NSString *department = [[membersSortedDict allKeys] firstObject];
    NSArray *members = membersSortedDict[department];
    return members[indexPath.row];
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


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        MainCollectionHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        NSDictionary *membersSortedDict = self.data[indexPath.section];
        NSString *department = [[membersSortedDict allKeys] firstObject];
        headerView.headerLabel.text = department;
        reusableview = headerView;
    }
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.collectionView.frame.size.width, 20);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    Employee *employee = [self getEmployeeFromIndexPath:indexPath];
    [cell setContent:employee];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:showDetailSegue sender:nil];
}


@end
