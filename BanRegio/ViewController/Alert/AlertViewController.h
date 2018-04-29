//
//  AlertViewController.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 28/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlertViewControllerDelegate<NSObject>
@optional
-(void)onButtonAcept;
-(void)onButtonError;
@end

@interface AlertViewController : UIViewController

@property (weak, nonatomic) id <AlertViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnAcept;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (nonatomic) BOOL askPermissions;

#pragma mark - hidden
-(void)hiddenButtonAcept;
-(void)hiddenButtonCancel;

@end
