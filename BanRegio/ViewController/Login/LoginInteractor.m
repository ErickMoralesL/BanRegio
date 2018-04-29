//
//  LoginInteractor.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "LoginInteractor.h"

@implementation LoginInteractor

#pragma mark - Validation

-(BOOL)getValidationLoginWithUserName:(UITextForm*)userName andPassword:(UITextForm*)password
{
    BOOL isUser = [TextValidations validate:FormTypeUserName andField:userName isRequired:YES];
    BOOL isPassword = [TextValidations validateForPassword:FormTypePassword andField:password isRequired:YES];
    
    if(!isUser)
        return NO;
    
    if(!isPassword)
        return NO;
    
    return YES;
}

#pragma mark - Services

-(void)initService
{
    if([InternetResponse internetRespose])
    {
        [self serviceLogin];
    }else{
        [_delegate onErrorInternet];
    }
}

-(void)serviceLogin
{
    [WSFacade loginSuccessBlock:^(id data) {
        UserVO *userVO = [[UserVO alloc] init];
        userVO.user = [data objectForKey:@"user"];
        userVO.password = [data objectForKey:@"password"];
        
        [self->_delegate onSuccessRequestWith:userVO];
        
    } errorBlock:^(id data) {
        [self->_delegate onErrorRequest];
    }];
}

@end
