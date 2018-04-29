//
//  WSCaller.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface WSCaller : NSObject

NS_ASSUME_NONNULL_BEGIN
+(void)executeServiceWithRequest:(nonnull NSURLRequest*)request successBlock:(ResponseBlock)onSuccess errorBlock:(ResponseBlock)onError;
NS_ASSUME_NONNULL_END

@end
