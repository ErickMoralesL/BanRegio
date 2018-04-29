//
//  TextValidations.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "TextValidations.h"

@implementation TextValidations

+(BOOL)validateCharacterLimit:(NSString *)string
{
    if([string length] > MAXLENGTH)
    {
        return NO;
    }else{
        
        return YES;
    }
}

+(BOOL)isEmpty:(NSString*)string
{
    if([string length] == 0 || [string isEqualToString:@""])
    {
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)validateWithRegex:(FormTypes)formType andString:(NSString*)string
{
    NSRegularExpression *regex = nil;
    
    switch (formType) {
        case FormTypeUserName:
            regex = [NSRegularExpression regularExpressionWithPattern:RGX_ALPHA
                                                              options:NSRegularExpressionCaseInsensitive
                                                                error:nil];
            break;
            break;
        case FormTypePassword:
            regex = [NSRegularExpression regularExpressionWithPattern:RGX_EASYPASS
                                                              options:NSRegularExpressionCaseInsensitive
                                                                error:nil];
            break;
        case FormTypeDate:
            regex = [NSRegularExpression regularExpressionWithPattern:RGX_DATE
                                                              options:NSRegularExpressionCaseInsensitive
                                                                error:nil];
        case FormTypeAlphanumeric:
            regex = [NSRegularExpression regularExpressionWithPattern:RGX_ALPHANUMERIC
                                                              options:NSRegularExpressionCaseInsensitive
                                                                error:nil];
            break;
        default:
            break;
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string
                                                        options:0
                                                          range:NSMakeRange(0, [string length])];
    if (numberOfMatches == 0)
    {
        return NO;
        
    }else{
        
        return YES;
    }
}

+(BOOL)validate:(FormTypes)formType andField:(UITextForm *)textField isRequired:(BOOL)isRequired
{
    
    if (isRequired)
    {
        if([TextValidations isEmpty:textField.text])
        {
            [TextValidations returnFormValid:FormErrorEmpty andTextField:textField];
            return NO;
            
        }else{
            
            //Validate form user name
            if(![TextValidations validateWithRegex:formType andString:textField.text])
            {
                [TextValidations returnFormValid:FormErrorInvalid andTextField:textField];
                return NO;
            }else{
                
                return YES;
            }
        }
        
    }else{
        
        return YES;
    }
}

+(BOOL)validateForPassword:(FormTypes)formType andField:(UITextForm *)textField isRequired:(BOOL)isRequired
{
    
    if (isRequired)
    {
        if([TextValidations isEmpty:textField.text])
        {
            [TextValidations returnFormValid:FormErrorEmpty andTextField:textField];
            return NO;
            
        }else{
            
            //Validate form user name
            if(![TextValidations validateWithRegex:formType andString:textField.text])
            {
                [TextValidations returnFormValid:FormPassword andTextField:textField];
                return NO;
            }else{
                
                return YES;
            }
        }
        
    }else{
        
        return YES;
    }
}

+(BOOL)AndField:(UITextForm *)textField isRequired:(BOOL)isRequired
{
    
    if (isRequired)
    {
        if([TextValidations isEmpty:textField.text])
        {
            [TextValidations returnFormValid:FormErrorEmpty andTextField:textField];
            return NO;
            
        } else {
            return YES;
        }
        
    }else{
        
        return YES;
    }
}

+(void)returnFormValid:(FormErrorMessage)formErrorMessage andTextField:(UITextForm*)txt
{
    switch (formErrorMessage)
    {
        case FormErrorEmpty:
            [txt showValidationError:NSLocalizedString(@"mandatoryValidation", @"")];
            break;
        case FormErrorInvalid:
            [txt showValidationError:NSLocalizedString(@"incorrectValidation", @"")];
            break;
        case FormPassword:
            [txt showValidationError:NSLocalizedString(@"passworIncorrectValidation", @"")];
            break;
        case FormValid:
            NSLog(@"Success");
            break;
        default:
            break;
    }
    
}

+(BOOL)Clean:(UITextForm*)textField isRequired:(BOOL)isRequired {
    [textField clearTextFieldValidation];
    return YES;
}
@end

