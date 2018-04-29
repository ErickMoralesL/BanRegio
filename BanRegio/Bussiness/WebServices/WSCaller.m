//
//  WSCaller.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "WSCaller.h"

@implementation WSCaller

+(void)executeServiceWithRequest:(nonnull NSMutableURLRequest*)request successBlock:(ResponseBlock)onSuccess errorBlock:(ResponseBlock)onError{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    configuration.timeoutIntervalForRequest = 60.0;
    configuration.timeoutIntervalForResource = 60.0;
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            onError(error);
        } else {
            onSuccess(responseObject);
        }
    }];
    [dataTask resume];
}

@end
