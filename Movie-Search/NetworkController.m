//
//  NetworkController.m
//  Movie-Search
//
//  Created by Julien Guanzon on 3/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NetworkController.h"

static NSString * const apiKey = @"f626eb7a4a3a56526580a732e05c21c9";

@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    return api;
    
}

+ (NSDictionary *)parametersWithAPIKey:(NSDictionary *)parameters {
    
    NSMutableDictionary *parametersWithKey = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    [parametersWithKey setObject:apiKey forKey:@"api_key"];
    
    return parametersWithKey;
}

+ (NSDictionary *)parametersWithAdultContentOff:(NSDictionary *)parameters {
    
    NSMutableDictionary *parametersWithAdultContentOff = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    [parametersWithAdultContentOff setObject:false forKey:@"include_adult"];
    
    return parametersWithAdultContentOff;
}

@end
