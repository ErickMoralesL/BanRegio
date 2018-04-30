//
//  ParserRealm.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "ParserRealm.h"

@implementation ParserRealm

+(NSObject*)getObjectToRealmObjetFor:(RealmType)type andRealmObjet:(RLMObject*)object
{
    ParserRealm *parserRLM = [[ParserRealm alloc] init];
    switch (type) {
        case RealmUser:
            return nil;
            break;
        default:
            return nil;
            break;
    }
}

+(RLMObject*)getRealmObjectForType:(RealmType)type andObject:(NSObject*)object
{
    ParserRealm *parserRLM = [[ParserRealm alloc] init];
    switch (type) {
        case RealmUser:
            return nil;
            break;
        default:
            return nil;
            break;
    }
}

@end
