//
//  ActionSheets.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "ActionSheets.h"

@implementation ActionSheets
@synthesize delegate = _delegate;

-(void)showActionSheet:(UIViewController*)viewController
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"titleAlertPhoto", @"") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"btnCancel", @"") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [self->_delegate optionSelectedFromAction:ActionSheetCancel];
        [actionSheet dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"btnCameraGeneric", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self->_delegate optionSelectedFromAction:ActionSheetTakePicture];
        [actionSheet dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"btnLibraryGenerc", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self->_delegate optionSelectedFromAction:ActionSheetFromLibrary];
        [actionSheet dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [viewController presentViewController:actionSheet animated:YES completion:nil];
}

+(void)shareContentWithUrl:(NSString *)urlString andView:(UIViewController *)viewController
{    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", urlString]];
    NSArray *activityItems = [NSArray arrayWithObjects:URL, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [viewController presentViewController:activityViewController animated:YES completion:nil];
    
}

@end
