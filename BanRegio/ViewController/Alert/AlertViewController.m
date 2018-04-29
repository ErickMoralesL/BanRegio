//
//  AlertViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 28/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewContentHigth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblTitleToBtnAcept;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnAceptHight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tnAbceptToBtnCancel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnCancelHight;

@end

@implementation AlertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setStyle];
    [self setData];
}

#pragma mark - set data

-(void)setData
{
    if(_askPermissions)
    {
        [self hiddenButtonCancel];
        [_lblTitle setText:NSLocalizedString(@"insufficientPermits", @"")];
    }
}

#pragma mark - Set Style

-(void)setStyle
{
    [Styles setBorderForView:_viewContent];
    [Styles setLabelTitleAlert:_lblTitle];
    [Styles setButtonAcept:_btnAcept];
    [Styles setButtonCancel:_btnCancel];
}

#pragma mark - hidden

-(void)hiddenButtonAcept
{
    _viewContentHigth.constant = _viewContentHigth.constant - (_lblTitleToBtnAcept.constant + _btnAceptHight.constant);
    _lblTitleToBtnAcept.constant = 0.0;
    _btnAceptHight.constant = 0.0;
    [_btnAcept setHidden:YES];
}

-(void)hiddenButtonCancel
{
    _viewContentHigth.constant = _viewContentHigth.constant - (_tnAbceptToBtnCancel.constant + _btnCancelHight.constant);
    _tnAbceptToBtnCancel.constant = 0.0;
    _btnCancelHight.constant = 0.0;
    [_btnCancel setHidden:YES];
}

#pragma mark - IBAction

-(IBAction)buttonAcept:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [_delegate onButtonAcept];
}

-(IBAction)buttonCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [_delegate onButtonError];
}

@end
