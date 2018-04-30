//
//  RealmInteractor.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "RealmInteractor.h"
#import "Realm.h"
#import "ParserRealm.h"

@interface RealmInteractor()

@property (strong, nonatomic)RealmFacade *realFacade;

@end

@implementation RealmInteractor

-(id)init
{
    if(self = [super init])
    {
        _realFacade = [RealmFacade sharedInstance];
        _realFacade.delegateRealmFacade = self;
    }
    return self;
}

#pragma mark - Realm Facade Delegate

-(RLMObject * _Nullable)saveRealmObjectForObject:(id _Nullable)object andType:(RealmType)type
{
    return [ParserRealm getRealmObjectForType:type andObject:object];
}

-(void)updateValueForType:(RealmType)type andRealmObject:(RLMObject*_Nullable)realmObject object:(id _Nullable )object
{
    
}

-(NSObject*_Nullable)getObjectForRealmObject:(RLMObject*_Nullable)objecRealm andType:(RealmType)type
{
    return [ParserRealm getObjectToRealmObjetFor:type andRealmObjet:objecRealm];
}

#pragma mark - User

-(void)saveUserVOWith:(UserVO*)userVO
{
    [_realFacade addForValue:userVO andType:RealmUser];
}

-(NSMutableArray<UserVO*>*)getArrayUserVO
{
    return [_realFacade getMutableArrayObjectForRealmObject:[UserRLM alloc] andType:RealmUser];
}

-(UserVO*)getUserVOForKey:(NSString*)key
{
    return (UserVO*)[_realFacade getObjetcForKey:key andObjectRLM:[UserRLM alloc]];
}

@end
