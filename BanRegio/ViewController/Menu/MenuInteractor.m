//
//  MenuInteractor.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "MenuInteractor.h"
#import "DashboardViewController.h"
#import "SectionOneViewController.h"
#import "SectionTwoViewController.h"
#import "SectionThreeViewController.h"

@interface MenuInteractor()

@property (strong, nonatomic) NSArray <NSString*>* arrayContentMenu;

@end

@implementation MenuInteractor

-(id)init
{
    if(self = [super init])
    {
        _arrayContentMenu = @[NSLocalizedString(@"home", @""),
                              NSLocalizedString(@"sectionOne", @""),
                              NSLocalizedString(@"sectionTwo", @""),
                              NSLocalizedString(@"sectionThree", @"")];
    }
    return self;
}

-(NSInteger)getContentMenu
{
    return _arrayContentMenu.count;
}

-(void)initCellForCell:(SectionTableViewCell*)cell andPosition:(NSInteger)position
{
    switch (position) {
        case 1:
            [self cellConetentWithName:_arrayContentMenu[position-1] andImageName:@"ic_home" Cell:cell];
            break;
        case 2:
            [self cellConetentWithName:_arrayContentMenu[position-1] andImageName:@"ic_phone" Cell:cell];
            break;
        case 3:
            [self cellConetentWithName:_arrayContentMenu[position-1] andImageName:@"ic_car" Cell:cell];
            break;
        case 4:
            [self cellConetentWithName:_arrayContentMenu[position-1] andImageName:@"ic_cloud" Cell:cell];
            break;
        default:
            break;
    }
}

-(void)cellConetentWithName:(NSString*)name andImageName:(NSString*)imageName Cell:(SectionTableViewCell*)cell
{
    [cell.lblTitle setText:name];
    [cell.imgView setImage:[UIImage imageNamed:imageName]];
}

-(void)navigationForPositionDidSelect:(NSInteger)position andSWRevealVireController:(SWRevealViewController *)revealController
{
    if (position != 0)
    {
        UINavigationController *navigationViewController = nil;
        navigationViewController = [[UINavigationController alloc]initWithRootViewController:[self didSelectForPosition:position]];
        [navigationViewController setNavigationBarHidden:YES];
        NSLog(@"VIEWC %@", revealController.navigationController.viewControllers);
        [revealController pushFrontViewController:navigationViewController animated:YES];
    }
}

-(UIViewController*)didSelectForPosition:(NSInteger)position
{
    switch (position) {
        case 1:
            return [[DashboardViewController alloc]initWithNibName:@"DashboardViewController" bundle:[NSBundle mainBundle]];
            break;
        case 2:
            return [[SectionOneViewController alloc]initWithNibName:@"SectionOneViewController" bundle:[NSBundle mainBundle]];;
            break;
        case 3:
            return [[SectionTwoViewController alloc]initWithNibName:@"SectionTwoViewController" bundle:[NSBundle mainBundle]];
            break;
        case 4:
            return [[SectionThreeViewController alloc]initWithNibName:@"SectionThreeViewController" bundle:[NSBundle mainBundle]];
            break;
        default:
            return nil;
            break;
    }
}

@end
