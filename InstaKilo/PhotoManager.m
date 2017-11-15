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
        _imageArray = @[_carImageArray, _peopleImageArray];
    }
    return self;
}



@end
