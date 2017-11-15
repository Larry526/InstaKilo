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
    return self.photoManager.imageArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.photoManager.imageArray objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.displayImage.image = [UIImage imageNamed:[self.photoManager.imageArray[indexPath.section] objectAtIndex:indexPath.row]];
    NSLog(@"Row: %li, Section: %li", indexPath.row, indexPath.section);

    return cell;
}

#pragma mark <ReusableView>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        PhotosCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = @"";
        if (indexPath.section == 0) {
            title = @"Cars";
        } else if (indexPath.section == 1) {
            title = @"People";
        }
        headerView.titleLabel.text = title;
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}



#pragma mark <Segmented Control>

- (IBAction)segmentPressed:(UISegmentedControl *)sender {
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        NSLog(@"All");
        //    cell.displayImage.image = [UIImage imageNamed:self.photoManager.imageArray[indexPath.row]];

    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        NSLog(@"Location");
        NSLog(@"%lu", self.photoManager.imageArray.count);
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        NSLog(@"Group");
    }

}


@end
