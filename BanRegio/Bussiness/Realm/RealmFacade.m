//
//  RealmFacade.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "RealmFacade.h"

@implementation RealmFacade

@synthesize realm = _realm;

+ (id)sharedInstance {
    static RealmFacade *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(id)init
{
    if(self=[super init])
    {
        self.realm = [RLMRealm defaultRealm];
    }
    return self;
}

#pragma mark - Delete Object

-(void)deleteObject:(RLMObject*)objec
{
    [_realm deleteObject:objec];
}

-(void)deletAllObject
{
    [_realm deleteAllObjects];
}

-(void)addForArray:(NSMutableArray*_Nullable)array andType:(RealmType)type
{
    for(int i=0;i<array.count;i++)
    {
        [_realm beginWriteTransaction];
        [_realm addObject:[_delegateRealmFacade saveRealmObjectForObject:array[i] andType:type]];
        [_realm commitWriteTransaction];
    }
}

-(void)updateForType:(RealmType)type andKey:(NSString *_Nullable)key object:(id _Nullable )object andObjetRealm:(RLMObject*) rlmObj;
{
    RLMObject* realmClass = [[rlmObj class] objectForPrimaryKey:key];
    [_realm beginWriteTransaction];
    [_delegateRealmFacade updateValueForType:type andRealmObject:realmClass object:object];
    [_realm commitWriteTransaction];
}

-(NSMutableArray*)getMutableArrayObjectForRealmObject:(RLMObject*)object andType:(RealmType)type
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    RLMResults *results = [[object class] allObjects];
    
    for (int i=0; i<results.count; i++)
    {
        [array addObject:[_delegateRealmFacade getObjectForRealmObject:results[i] andType:type]];
    }
    
    return array;
}

-(void)deletRLMResultForRealmObject:(RLMObject*)object
{
    RLMResults *realmArray = [[object class] allObjects];
    
    for(int i=0;i<realmArray.count;i++)
    {
        [_realm beginWriteTransaction];
        [self deleteObject:realmArray[i]];
        [_realm commitWriteTransaction];
    }
}

-(void)addForValue:(id _Nullable)object andType:(RealmType)type
{
    [_realm beginWriteTransaction];
    [_realm addObject:[_delegateRealmFacade saveRealmObjectForObject:object andType:type]];
    [_realm commitWriteTransaction];
}

@end
