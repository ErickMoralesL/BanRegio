//
//  InternetResponse.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "InternetResponse.h"
#import "Reachability.h"

@implementation InternetResponse

+(BOOL)internetRespose
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    if([reachability currentReachabilityStatus])
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }else{
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
}


@end
