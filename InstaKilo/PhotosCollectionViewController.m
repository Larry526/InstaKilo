//
//  PhotosCollectionViewController.m
//  InstaKilo
//
//  Created by Larry Luk on 2017-11-15.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "PhotoManager.h"
#import "PhotosCollectionReusableView.h"

@interface PhotosCollectionViewController () <UICollectionViewDataSource> 

@property (strong, nonatomic) PhotoManager *photoManager;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation PhotosCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoManager = [[PhotoManager alloc]init];
    
    // tweaks space between sections
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSArray *selectedImageSections = self.photoManager.rootImageArray[self.segmentedControl.selectedSegmentIndex];
    return selectedImageSections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *selectedImageSections = self.photoManager.rootImageArray[self.segmentedControl.selectedSegmentIndex];
    return [((NSArray *)[selectedImageSections objectAtIndex:section]) count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // This gets me segmented control selection
    NSArray *selecteSegmentPhotoSections = self.photoManager.rootImageArray[self.segmentedControl.selectedSegmentIndex]; //array of sections
    
    // I want to get the specified section from that array
    NSArray *selectedSegmentPhotoSectionRows = selecteSegmentPhotoSections[indexPath.section]; // array of rows
    
    NSString *imageName = selectedSegmentPhotoSectionRows[indexPath.row];
    
    UIImage *displayImage = [UIImage imageNamed:imageName];

    cell.displayImage.image = displayImage;
    
    
//    cell.displayImage.image = [UIImage imageNamed:[selecteSegmentPhotoSections[indexPath.section] objectAtIndex:indexPath.row]];

    return cell;
}

#pragma mark <ReusableView>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        PhotosCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = @"";
        if (indexPath.section == 0 && self.segmentedControl.selectedSegmentIndex == 0) {
            title = @"Cars";
        } else if (indexPath.section == 1 && self.segmentedControl.selectedSegmentIndex == 0) {
            title = @"People";
        } else if (indexPath.section == 0 && self.segmentedControl.selectedSegmentIndex == 1) {
            title = @"Indoor";
        } else if (indexPath.section == 1 && self.segmentedControl.selectedSegmentIndex == 1) {
            title = @"Outdoor";
        }

        headerView.titleLabel.text = title;
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}



#pragma mark <Segmented Control>

- (IBAction)segmentPressed:(UISegmentedControl *)sender {
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        NSLog(@"Location");
        [self.collectionView reloadData];
        

    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        [self.collectionView reloadData];
        NSLog(@"Group");
        
    }

}


@end
