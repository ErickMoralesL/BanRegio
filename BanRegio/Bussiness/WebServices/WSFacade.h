//
//  WSFacade.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 28/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSFacade : NSObject

+(void)loginSuccessBlock:(ResponseBlock)onSuccess errorBlock:(ResponseBlock)onError;

@end
