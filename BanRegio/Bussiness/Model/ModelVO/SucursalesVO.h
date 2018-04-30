//
//  SucursalesVO.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 30/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SucursalesVO : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *tipo;
@property (strong, nonatomic) NSString *NOMBRE;
@property (strong, nonatomic) NSString *DOMICILIO;
@property (strong, nonatomic) NSString *HORARIO;
@property (strong, nonatomic) NSString *TELEFONO_PORTAL;
@property (strong, nonatomic) NSString *TELEFONO_APP;
@property (strong, nonatomic) NSString *HORAS;
@property (strong, nonatomic) NSString *SABADOS;
@property (strong, nonatomic) NSString *CIUDAD;
@property (strong, nonatomic) NSString *ESTADO;
@property (strong, nonatomic) NSString *Latitud;
@property (strong, nonatomic) NSString *Longitud;
@property (strong, nonatomic) NSString *Correo_Gerente;
@property (strong, nonatomic) NSString *URL_FOTO;
@property (strong, nonatomic) NSString *Suc_Estado_Prioridad;
@property (strong, nonatomic) NSString *Suc_Ciudad_Prioridad;

@end
