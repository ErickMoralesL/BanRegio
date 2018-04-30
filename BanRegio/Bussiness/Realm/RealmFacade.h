//
//  RealmFacade.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"

@protocol RealFacadeDelegate <NSObject>
@required
-(RLMObject*_Nullable)saveRealmObjectForObject:(id _Nullable )object andType:(RealmType)type;
-(void)updateValueForType:(RealmType)type andRealmObject:(RLMObject*_Nullable)realmObject object:(id _Nullable )object;
-(NSObject*_Nullable)getObjectForRealmObject:(RLMObject*_Nullable)objecRealm andType:(RealmType)type;
@end

@interface RealmFacade : NSObject

@property(strong, nonatomic)RLMRealm * _Nullable realm;
NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, weak) id <RealFacadeDelegate> delegateRealmFacade;
NS_ASSUME_NONNULL_END

-(void)deleteObject:(RLMObject*_Nullable)objec;
-(void)deletAllObject;
+(id _Nullable )sharedInstance;

-(void)addForArray:(NSMutableArray*_Nullable)array andType:(RealmType)type;
-(void)updateForType:(RealmType)type andKey:(NSString *_Nullable)key object:(id _Nullable )object andObjetRealm:(RLMObject*_Nullable) rlmObj;
-(NSMutableArray*_Nullable)getMutableArrayObjectForRealmObject:(RLMObject*_Nullable)object andType:(RealmType)type;
-(void)deletRLMResultForRealmObject:(RLMObject*_Nullable)object;
-(void)addForValue:(id _Nullable)object andType:(RealmType)type;

@end
