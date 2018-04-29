//
//  HomeInteractor.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeInteractor : NSObject

-(BOOL)getValidationWithName:(UITextForm*)name LastName:(UITextForm*)lastname andAddress:(UITextForm*)address;

@end
