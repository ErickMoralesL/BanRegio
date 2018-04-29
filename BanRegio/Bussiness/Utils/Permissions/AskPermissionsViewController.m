//
//  AskPermissionsViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "AskPermissionsViewController.h"

@interface AskPermissionsViewController () <AlertViewControllerDelegate>

@property (nonatomic) PermissionType permissionTypeAler;

@end

@implementation AskPermissionsViewController

@synthesize type = _type;
@synthesize completitionSuccess = _completitionSuccess;
@synthesize completitionError = _completitionError;

- (void)viewDidLoad {
    [super viewDidLoad];
    _completitionError = nil;
    _completitionSuccess = nil;
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    switch (_type) {
        case PermissionTypeCamera:
            // Ask Camera Permissions
            [self grantPermissionsForCamera];
            break;
        case PermissionTypeGps:
            [self grantPermissionsForGPS];
            break;
        case PermissionTypeLibrary:
            [self grantPermissionsForCamera];
            break;
        default:
            break;
    }
}

-(void)grantPermissionsForLibrary
{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        //[AskPermissionsViewController showPermissionsLogic:PermissionTypeLibrary];
        if (status != PHAuthorizationStatusAuthorized)
            [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

-(void)grantPermissionsForCamera
{
    NSString *mediaType = AVMediaTypeVideo;
    [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
        if(granted){
            //if(_completitionSuccess) _completitionSuccess();
            [self dismissViewControllerAnimated:YES completion:nil];
            if(self->_Success != nil)
                self->_Success();
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
            [self showPermissionsLogic:PermissionTypeCamera];
            if(self->_Error != nil)
                self->_Error();
        }
        
    }];
}

-(void)grantPermissionsForGPS
{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
        [self showPermissionsLogic:PermissionTypeGps];
        
    }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locationManager.delegate = self;
        [self.locationManager requestWhenInUseAuthorization];
    }else{
        self.locationManager.delegate = self;
        [self.locationManager requestWhenInUseAuthorization];
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusDenied) {
        [self dismissViewControllerAnimated:YES completion:nil];
        if(_Error != nil)
            _Error();
    }
    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self dismissViewControllerAnimated:YES completion:nil];
        if(_Success != nil)
            _Success();
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
        [self showPermissionsLogic:PermissionTypeGps];
        if(_Error != nil)
            _Error();
    }
}

-(void)showPermissionsLogic:(PermissionType)permissionType
{
    AlertViewController *alert = [[AlertViewController alloc] initWithNibName:@"AlertViewController" bundle:[NSBundle mainBundle]];
    alert.askPermissions = YES;
    alert.delegate = self;
    _permissionTypeAler = permissionType;
    
    alert.modalPresentationStyle = UIModalPresentationFullScreen;
    alert.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)onButtonAcept
{
    if(_permissionTypeAler == PermissionTypeGps)
        if(_Error != nil)
            _Error();
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(BOOL) haveCameraPermission{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        return YES;
    } else if(authStatus == AVAuthorizationStatusDenied)
    {
        return NO;
    } else if(authStatus == AVAuthorizationStatusRestricted)
    {
        return NO;
    } else if(authStatus == AVAuthorizationStatusNotDetermined)
    {
        return NO;
    } else {
        return NO;
    }
}

+(BOOL) haveGaleryPermission{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if(status == PHAuthorizationStatusNotDetermined)
    {
        return NO;
    } else if (status == PHAuthorizationStatusAuthorized)
    {
        return YES;
    } else if (status == PHAuthorizationStatusRestricted)
    {
        return NO;
    } else if (status == PHAuthorizationStatusDenied) {
        return NO;
    }else{
        return NO;
    }
}

+(BOOL) haveGPSPermission{
    //return !([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied);
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        return NO;
    }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        return YES;
    }else
        return NO;
}

@end
