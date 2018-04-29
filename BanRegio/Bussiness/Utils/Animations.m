//
//  Animations.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 27/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "Animations.h"

@implementation Animations

+(void)viewVibrateAnimationForItem:(UIView*)view
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = 0.1;
    animation.byValue = @(8);
    animation.autoreverses = YES;
    animation.repeatCount = 4;
    [view.layer addAnimation:animation forKey:@"Shake"];
}

@end
