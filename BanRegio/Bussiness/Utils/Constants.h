//
//  Constants.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 25/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

#pragma mark - URL
extern NSString *const URL_MAIN;
extern NSString *const URL_LOGIN;

#pragma mark - Regex

extern NSString *const RGX_ALPHANUMERIC;
extern NSString *const RGX_EASYPASS;
extern NSString *const RGX_ALPHA;
extern NSString *const RGX_DATE;

#pragma mark - Blocks
typedef void (^ResponseBlock)(id);
typedef void (^Baseblock)(void);

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

#pragma mark - FormTypes and Validations
typedef NS_ENUM(NSUInteger, FormTypes)
{
    FormTypeUserName,
    FormTypePassword,
    FormTypeDate,
    FormTypeAlphanumeric
};

typedef NS_ENUM(NSUInteger, FormErrorMessage)
{
    FormErrorEmpty,
    FormErrorInvalid,
    FormValid,
    FormPassword
};

typedef NS_ENUM(NSUInteger, PermissionType)
{
    PermissionTypeCamera,
    PermissionTypeLibrary,
    PermissionTypeGps
};

typedef NS_ENUM(NSUInteger, ActionSheet)
{
    ActionSheetTakePicture,
    ActionSheetFromLibrary,
    ActionSheetCancel
};

@end
