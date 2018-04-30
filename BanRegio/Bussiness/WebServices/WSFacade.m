//
//  WSFacade.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 28/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "WSFacade.h"
#import "WSCaller.h"

@implementation WSFacade

#pragma mark - Login

+(void)loginSuccessBlock:(ResponseBlock)onSuccess errorBlock:(ResponseBlock)onError
{
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",URL_MAIN,URL_LOGIN];
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSMutableURLRequest *requeste = [NSMutableURLRequest requestWithURL:url];
    [requeste setHTTPMethod:@"GET"];
    
    [WSCaller executeServiceWithRequest:requeste successBlock:onSuccess errorBlock:onError];
}

+(void)branchSuccessBlock:(ResponseBlock)onSuccess errorBlock:(ResponseBlock)onError
{
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",URL_MAIN,URL_BRANCH];
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSMutableURLRequest *requeste = [NSMutableURLRequest requestWithURL:url];
    [requeste setHTTPMethod:@"GET"];
    
    [WSCaller executeServiceWithRequest:requeste successBlock:onSuccess errorBlock:onError];
}

@end
