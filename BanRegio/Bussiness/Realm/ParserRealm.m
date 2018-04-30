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
            return [parserRLM getUserVOWithUserRLM:(UserRLM *)object];
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
            return [parserRLM getUserRLMWithUserVO:(UserVO *)object];
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - User

-(UserVO*)getUserVOWithUserRLM:(UserRLM*)userRLM
{
    UserVO *userVO = [[UserVO alloc] init];
    userVO.user = userRLM.user;
    userVO.lastName = userRLM.lastName;
    userVO.birthday = userRLM.birthday;
    userVO.address = userRLM.address;
    userVO.data = userRLM.data;
    return userVO;
}

-(UserRLM*)getUserRLMWithUserVO:(UserVO*)userVO
{
    UserRLM *userRLM = [[UserRLM alloc] init];
    userRLM.user = userVO.user;
    userRLM.lastName = userVO.lastName;
    userRLM.birthday = userVO.birthday;
    userRLM.address = userVO.address;
    userRLM.data = userVO.data;
    return userRLM;
}

@end
