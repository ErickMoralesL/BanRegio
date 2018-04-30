//
//  UserRLM.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"

@interface UserRLM : RLMObject

@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *birthday;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSData *data;

@end

RLM_ARRAY_TYPE(UserRLM)
