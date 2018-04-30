//
//  SectionOneViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "SectionOneViewController.h"

@interface SectionOneViewController ()<SWRevealViewControllerDelegate>
{
    SWRevealViewController *revealController;
}


@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblTitleHeader;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;

@end

@implementation SectionOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setStyle];
}

#pragma mark - Set Data

-(void)setData
{
    revealController = [self revealViewController];
    if (revealController)
    {
        revealController.delegate = self;
        [revealController panGestureRecognizer];
        [revealController tapGestureRecognizer];
        //Add an image to your project & set that image here.
        
        [revealController.panGestureRecognizer setEnabled:YES];
        [revealController.tapGestureRecognizer setEnabled:YES];
        
        [_btnMenu addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [_lblTitleHeader setText:NSLocalizedString(@"sectionOne", @"")];
}

#pragma mark - Set Style

-(void)setStyle
{
    [_viewHeader setBackgroundColor:[Colors gray192Color]];
    [Styles setLabelTitleHeader:_lblTitleHeader];
}

@end
