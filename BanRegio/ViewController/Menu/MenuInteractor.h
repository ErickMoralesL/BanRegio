//
//  MenuInteractor.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionTableViewCell.h"

@interface MenuInteractor : NSObject

-(NSInteger)getContentMenu;
-(void)initCellForCell:(SectionTableViewCell*)cell andPosition:(NSInteger)position;
-(void)navigationForPositionDidSelect:(NSInteger)position andSWRevealVireController:(SWRevealViewController *)revealController;

@end
