//
//  Fonts.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "Fonts.h"

@implementation Fonts

+(UIFont*)fontTitleHeader
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:25.0];
}

+(UIFont*)fontButtonGeneric
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:17.0];
}

+(UIFont*)fontTitle
{
    return [UIFont systemFontOfSize:19.0];
}

+(UIFont*)fontTitleAlert
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
}

+(UIFont*)fontButtonAceptAlert
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
}

+(UIFont*)fontButtonAceptCancel
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
}

+(UIFont*)fontSubTitle
{
    return [UIFont systemFontOfSize:17.0];
}

@end
