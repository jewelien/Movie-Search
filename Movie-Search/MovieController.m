//
//  MovieController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MovieController.h"
#import "NetworkController.h"

@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)moviesWithTitle: (NSString *)title completion:(void (^)(BOOL success))completion {
    
    [[NetworkController api] GET:@"search/movie" parameters:[NetworkController parametersWithAPIKey:@{@"query": title}] success:^(NSURLSessionDataTask *task, id responseObject) {
        self.resultMovies = responseObject[@"results"];
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO);
    }];
    
}

- (void)movieWithID: (int)ID completion:(void (^)(BOOL success))completion {
    
    [[NetworkController api] GET:@"/movie/" parameters:[NetworkController parametersWithAPIKey:@{@"overview": id}] success:^(NSURLSessionDataTask *task, id responseObject) {
        self.resultMovies = responseObject[@"results"];
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO);
    }];
    
}



@end
