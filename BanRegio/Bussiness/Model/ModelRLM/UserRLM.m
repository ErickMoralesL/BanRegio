//
//  UserRLM.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "UserRLM.h"

@implementation UserRLM

@synthesize user;
@synthesize birthday;
@synthesize address;
@synthesize lastName;
@synthesize data;

+(NSString *)primaryKey{
    return @"user";
}

@end
