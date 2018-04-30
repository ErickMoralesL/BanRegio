//
//  UserSingleton.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 30/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSingleton : NSObject

@property (nonatomic, strong) UserVO* user;

+(id)sharedInstance;


@end
