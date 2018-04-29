//
//  TextValidations.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextValidations : NSObject

+(BOOL)validate:(FormTypes)formType andField:(UITextForm*)textField isRequired:(BOOL)isRequired;
+(BOOL)AndField:(UITextForm*)textField isRequired:(BOOL)isRequired;
+(BOOL)validateForPassword:(FormTypes)formType andField:(UITextForm*)textField isRequired:(BOOL)isRequired;
+(BOOL)Clean:(UITextForm*)textField isRequired:(BOOL)isRequired;

@end
