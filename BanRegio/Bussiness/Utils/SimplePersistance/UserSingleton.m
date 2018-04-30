//
//  UserSingleton.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 30/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "UserSingleton.h"

@implementation UserSingleton

@synthesize user;

+(id)sharedInstance
{
    static UserSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(id)init
{
    if (self = [super init])
    {
        user = [[UserVO alloc] init];
    }
    return self;
}

@end
