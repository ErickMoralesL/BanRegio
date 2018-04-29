//
//  ActionSheets.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionSheetNotification <NSObject>

@optional
-(void)optionSelectedFromAction:(ActionSheet)act;
@end

@interface ActionSheets : NSObject

NS_ASSUME_NONNULL_BEGIN
@property(weak, nonatomic)id <ActionSheetNotification>delegate;
NS_ASSUME_NONNULL_END

-(void)showActionSheet:(nonnull UIViewController*)viewController;
+(void)shareContentWithUrl:(nonnull NSString*)urlString andView:(nonnull UIViewController*)viewController;

@end
