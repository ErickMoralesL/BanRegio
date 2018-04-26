//
//  ViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitleHeader;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setStyle];
}

#pragma mark - Set Data

-(void)setData
{
    [_lblTitleHeader setText:NSLocalizedString(@"titleHeader", @"")];
    [_lblTitle setText:NSLocalizedString(@"titleHeader", @"")];
    [_btnLogin setTitle:NSLocalizedString(@"btnLogin", @"") forState:UIControlStateNormal];
}

#pragma mark - Set Style

-(void)setStyle
{
    [Styles setLabelTitleHeader:_lblTitleHeader];
    [_viewHeader setBackgroundColor:[Colors gray192Color]];
}

#pragma mark - IBAction

-(IBAction)buttonLogin:(id)sender
{
}


@end
