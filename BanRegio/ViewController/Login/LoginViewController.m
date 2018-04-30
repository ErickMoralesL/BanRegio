//
//  ViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginInteractor.h"
#import "HomeViewController.h"

#define LATITUDE 25.7048152
#define LONGITUDE -100.2880844

@interface LoginViewController ()<LoginInteractorDelegate>
{
    YBHud *hud;
}

@property (weak, nonatomic) IBOutlet UILabel *lblTitleHeader;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@property (weak, nonatomic) IBOutlet UITextForm *txtFormUserName;
@property (weak, nonatomic) IBOutlet UITextForm *txtFormPassword;

@property (weak, nonatomic) IBOutlet UILabel *lblTitleMap;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) LoginInteractor *interactor;

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
    [_lblTitle setText:NSLocalizedString(@"login", @"")];
    [_btnLogin setTitle:NSLocalizedString(@"btnLogin", @"") forState:UIControlStateNormal];
    [_txtFormUserName setPlaceholder:NSLocalizedString(@"txtUserBanRegio", @"")];
    [_txtFormPassword setPlaceholder:NSLocalizedString(@"txtPassworBanRegio", @"")];
    
    _interactor = [[LoginInteractor alloc] init];
    _interactor.delegate = self;
    
    hud = [[YBHud alloc] initWithHudType:DGActivityIndicatorAnimationTypeBallBeat andText:@"Cargando"];
    
    CLLocationCoordinate2D coord = {.latitude = LATITUDE, .longitude = LONGITUDE};
    MKCoordinateSpan span = {.latitudeDelta = 0.2f, .longitudeDelta = 0.2f};
    MKCoordinateRegion region = {coord, span};
    [_mapView setRegion:region];
    
    [hud showInView:self.view animated:YES];
    [_interactor initServiceBranchOffices];
    
//    CLLocationCoordinate2D coordPin = {.latitude = 25.708504, .longitude = -100.284536};
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//    [annotation setCoordinate:coordPin];
//    [annotation setTitle:@"FÉLIX U. GOMEZ"]; //You can set the subtitle too
//    [self.mapView addAnnotation:annotation];
//
//    CLLocationCoordinate2D coordPinOne = {.latitude = 25.700002, .longitude = -100.363589};
//    MKPointAnnotation *annotationOne = [[MKPointAnnotation alloc] init];
//    [annotationOne setCoordinate:coordPinOne];
//    [annotationOne setTitle:@"CUMBRES"]; //You can set the subtitle too
//    [self.mapView addAnnotation:annotationOne];
    
}

#pragma mark - Set Style

-(void)setStyle
{
    [Styles setLabelTitleHeader:_lblTitleHeader];
    [_viewHeader setBackgroundColor:[Colors gray192Color]];
    [Styles setButtonGeneric:_btnLogin];
    [Styles setLabelTitle:_lblTitle];
}

#pragma mark - IBAction

-(IBAction)buttonLogin:(id)sender
{
    if([_interactor getValidationLoginWithUserName:_txtFormUserName andPassword:_txtFormPassword])
    {
        [hud showInView:self.view animated:YES];
        [_interactor initService];
    }
}

#pragma mark - Login Interactor Delegate

-(void)onSuccessRequestWith:(UserVO*)userVO
{
    [hud dismissAnimated:YES];
    if([userVO.user isEqualToString:_txtFormUserName.text] && [userVO.password isEqualToString:_txtFormPassword.text])
    {
        HomeViewController *homeVC = [[HomeViewController alloc] init];
        [self.navigationController pushViewController:homeVC animated:YES];
    }else{
        [self showAlertWithTitle:NSLocalizedString(@"titleIncorrectLogin", @"") titleButtonAcept:NSLocalizedString(@"btnAcept", @"")];
    }
}

-(void)onSuccessRequestWithBranch:(NSMutableArray<SucursalesVO*>*)array
{
    [hud dismissAnimated:YES];
    for(int i=0;i<array.count;i++)
    {
        float lat = [array[i].Latitud floatValue];
        float lng = [array[i].Longitud floatValue];
        CLLocationCoordinate2D coordPin = {.latitude = lat, .longitude = lng};
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:coordPin];
        [annotation setTitle:array[i].NOMBRE]; //You can set the subtitle too
        [self.mapView addAnnotation:annotation];
    }
}

-(void)onErrorRequest
{
    [hud dismissAnimated:YES];
    [self showAlertWithTitle:NSLocalizedString(@"requestError", @"")
            titleButtonAcept:NSLocalizedString(@"btnAcept", @"")];
}

-(void)onErrorInternet
{
    [hud dismissAnimated:YES];
    [self showAlertWithTitle:NSLocalizedString(@"internetError", @"") titleButtonAcept:NSLocalizedString(@"btnAcept", @"")];
}

#pragma mark - Alert

-(void)showAlertWithTitle:(NSString*)title titleButtonAcept:(NSString*)btnAcept
{
    AlertViewController *alertVC = [[AlertViewController alloc] init];
    alertVC.modalPresentationStyle = UIModalPresentationFullScreen;
    alertVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:alertVC animated:YES completion:nil];
    [alertVC.lblTitle setText:title];
    [alertVC.btnAcept setTitle:btnAcept forState:UIControlStateNormal];
    [alertVC hiddenButtonCancel];
}

@end
