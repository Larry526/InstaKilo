//
//  PhotoManager.m
//  InstaKilo
//
//  Created by Larry Luk on 2017-11-15.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "PhotoManager.h"

@implementation PhotoManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _carImageArray = @[@"1.jpg", @"5.jpy", @"7.jpg"];
        _peopleImageArray = @[@"3.jpg", @"2.jpg", @"4.jpg", @"6.jpg", @"8.jpg",@"9.jpg",@"10.jpg"];
        _groupArray = @[_carImageArray, _peopleImageArray];
        
        _indoorImageArray = @[@"2.jpg", @"6.jpg", @"7.jpg", @"10.jpg"];
        _ourdoorImageArray = @[@"1.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"8.jpg", @"9.jpg"];
        _locationArray = @[_indoorImageArray, _ourdoorImageArray];
        
        _rootImageArray = @[_groupArray, _locationArray];
        
    }
    return self;
}



@end
