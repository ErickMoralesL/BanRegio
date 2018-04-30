//
//  ParserRealm.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"

@interface ParserRealm : NSObject

+(NSObject*)getObjectToRealmObjetFor:(RealmType)type andRealmObjet:(RLMObject*)object;
+(RLMObject*)getRealmObjectForType:(RealmType)type andObject:(NSObject*)object;

@end
