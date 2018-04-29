//
//  AskPermissionsViewController.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <MapKit/MapKit.h>

@interface AskPermissionsViewController : UIViewController <CLLocationManagerDelegate>

@property Baseblock Success;
@property Baseblock Error;

@property(nonatomic, assign) PermissionType type;
@property(nonatomic, assign) Baseblock completitionSuccess;
@property(nonatomic, assign) Baseblock completitionError;

@property (nonatomic) CLAuthorizationStatus status;
@property (nonatomic, assign) CLLocationManager *locationManager;

+(BOOL) haveCameraPermission;
+(BOOL) haveGaleryPermission;
+(BOOL) haveGPSPermission;

@end
