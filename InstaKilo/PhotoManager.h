//
//  PhotoManager.h
//  InstaKilo
//
//  Created by Larry Luk on 2017-11-15.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoManager : NSObject

@property (nonatomic, strong) NSArray *groupArray;
@property (nonatomic, strong) NSArray *carImageArray;
@property (nonatomic, strong) NSArray *peopleImageArray;

@property (nonatomic, strong) NSArray *locationArray;
@property (nonatomic, strong) NSArray *ourdoorImageArray;
@property (nonatomic, strong) NSArray *indoorImageArray;

@property (nonatomic, strong) NSArray *rootImageArray;

@end
