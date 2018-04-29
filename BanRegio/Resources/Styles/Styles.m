//
//  Styles.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "Styles.h"

@implementation Styles

+(void)setLabelTitleHeader:(UILabel*)lbl
{
    [lbl setTextColor:[Colors colorTitleHeader]];
    [lbl setFont:[Fonts fontTitleHeader]];
}

+(void)setButtonGeneric:(UIButton*)btn
{
    [btn setBackgroundColor:[Colors gray121Color]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[Fonts fontButtonGeneric]];
    [Styles setBorderForView:btn];
}

+(void)setBorderForView:(UIView*)view
{
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 6;
    
    view.layer.shadowColor = [UIColor colorWithRed:59.0f / 255.0f green:74.0f / 255.0f blue:116.0f / 255.0f alpha:0.35f].CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 15);
    view.layer.shadowRadius = 12.5;
    view.layer.shadowOpacity = 0.8;
}

+(void)setLabelTitle:(UILabel*)lbl
{
    [lbl setTextColor:[Colors gray121Color]];
    [lbl setFont:[Fonts fontTitle]];
}

+(void)setLabelTitleAlert:(UILabel*)lbl
{
    [lbl setTextColor:[Colors gray121Color]];
    [lbl setFont:[Fonts fontTitleAlert]];
}

+(void)setButtonAcept:(UIButton*)btn
{
    [btn setBackgroundColor:[Colors gray121Color]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[Fonts fontButtonAceptAlert]];
    [Styles setBorderForView:btn];
}

+(void)setButtonCancel:(UIButton*)btn
{
    [btn setBackgroundColor:[Colors lightGrayColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[Fonts fontButtonAceptCancel]];
    [Styles setBorderForView:btn];
}

+(void)setViewCircular:(UIView*)view
{
    view.clipsToBounds = YES;
    view.layer.cornerRadius = view.frame.size.height / 2;
}

+(void)setButtonGenericaAlternate:(UIButton*)btn
{
    [btn setBackgroundColor:[Colors gray247Color]];
    [btn setTitleColor:[Colors gray121Color] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[Fonts fontButtonGeneric]];
    [Styles setBorderForView:btn];
}

+(void)setLabelSubTitle:(UILabel*)lbl
{
    [lbl setTextColor:[Colors gray121Color]];
    [lbl setFont:[Fonts fontSubTitle]];
}

@end
