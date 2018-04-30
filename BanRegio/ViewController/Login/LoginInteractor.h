//
//  LoginInteractor.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 26/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginInteractorDelegate<NSObject>
@required
-(void)onSuccessRequestWith:(UserVO*)userVO;
-(void)onSuccessRequestWithBranch:(NSMutableArray<SucursalesVO*>*)array;
-(void)onErrorRequest;
-(void)onErrorInternet;
@end

@interface LoginInteractor : NSObject

@property (weak, nonatomic) id <LoginInteractorDelegate> delegate;

#pragma mark - Validation
-(BOOL)getValidationLoginWithUserName:(UITextForm*)userName andPassword:(UITextForm*)password;


#pragma mark - Services
-(void)initService;
-(void)initServiceBranchOffices;

@end
