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

-(void)initServiceBranchOffices
{
    if([InternetResponse internetRespose])
    {
        [self serviceBranchOffices];
    }else{
        [_delegate onErrorInternet];
    }
}

-(void)serviceBranchOffices
{
    [WSFacade branchSuccessBlock:^(id data) {
        NSArray *array = data;
        NSMutableArray <SucursalesVO*>*arrayBranch = [[NSMutableArray alloc] init];
        
        for (int i=0; i<array.count; i++)
        {
            SucursalesVO *sucursalesVO = [[SucursalesVO alloc] init];
            sucursalesVO.ID = [array[i] objectForKey:@"ID"];
            sucursalesVO.tipo = [array[i] objectForKey:@"tipo"];
            sucursalesVO.NOMBRE = [array[i] objectForKey:@"NOMBRE"];
            sucursalesVO.DOMICILIO = [array[i] objectForKey:@"DOMICILIO"];
            sucursalesVO.HORARIO = [array[i] objectForKey:@"HORARIO"];
            sucursalesVO.TELEFONO_PORTAL = [array[i] objectForKey:@"TELEFONO_PORTAL"];
            sucursalesVO.TELEFONO_APP = [array[i] objectForKey:@"TELEFONO_APP"];
            sucursalesVO.HORAS = [array[i] objectForKey:@"24_HORAS"];
            sucursalesVO.SABADOS = [array[i] objectForKey:@"SABADOS"];
            sucursalesVO.CIUDAD = [array[i] objectForKey:@"CIUDAD"];
            sucursalesVO.ESTADO = [array[i] objectForKey:@"ESTADO"];
            sucursalesVO.Latitud = [array[i] objectForKey:@"Latitud"];
            sucursalesVO.Longitud = [array[i] objectForKey:@"Longitud"];
            sucursalesVO.Correo_Gerente = [array[i] objectForKey:@"Correo_Gerente"];
            sucursalesVO.URL_FOTO = [array[i] objectForKey:@"URL_FOTO"];
            sucursalesVO.Suc_Estado_Prioridad = [array[i] objectForKey:@"Suc_Estado_Prioridad"];
            sucursalesVO.Suc_Ciudad_Prioridad = [array[i] objectForKey:@"Suc_Ciudad_Prioridad"];
            [arrayBranch addObject:sucursalesVO];
        }
        
        [self->_delegate onSuccessRequestWithBranch:arrayBranch];
        
    } errorBlock:^(id data) {
        [self.delegate onErrorRequest];
    }];
}

@end
