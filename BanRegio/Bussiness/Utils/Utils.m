//
//  Utils.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)showTitleFonts
{
    for (NSString *familyName in [UIFont familyNames]){
        NSLog(@"Family name: %@", familyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"--Font name: %@", fontName);
        }
    }
}

@end
