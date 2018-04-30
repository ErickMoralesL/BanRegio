//
//  Constants.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 25/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "Constants.h"

@implementation Constants

#pragma mark - URL
NSString *const URL_MAIN = @"http://json.banregio.io/";
NSString *const URL_LOGIN = @"login";
NSString *const URL_BRANCH = @"sucursales";

#pragma mark - Regex
NSString *const RGX_ALPHANUMERIC = @"^[a-zA-Z0-9áéíóú\\s]*$";
NSString *const RGX_EASYPASS     = @"(.{8,100})";
NSString *const RGX_ALPHA        = @"^[a-zA-ZÀ-ÿ\\s']+$";
NSString *const RGX_DATE         = @"/^((0[1-9]|[12][0-9]|3[01])(\\/)(0[13578]|1[02]))|((0[1-9]|[12][0-9])(\\/)(02))|((0[1-9]|[12][0-9]|3[0])(\\/)(0[469]|11))(\\/)\\d{4}$/;";

@end
