//
//  MovieController.h
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;

- (void)moviesWithTitle: (NSString *)title completion:(void (^)(BOOL success))completion;

@end
