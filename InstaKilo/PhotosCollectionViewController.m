//
//  PhotosCollectionViewController.m
//  InstaKilo
//
//  Created by Larry Luk on 2017-11-15.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "CustomCollectionViewCell.h"

@interface PhotosCollectionViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *displayImagesArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation PhotosCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayImagesArray = [NSArray arrayWithObjects: @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",nil];
  
}s

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.displayImagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.displayImage.image = [UIImage imageNamed:self.displayImagesArray[indexPath.row]];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
