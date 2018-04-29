//
//  HomeViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 28/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeInteractor.h"
#import "CalendarViewController.h"

@interface HomeViewController ()<ActionSheetNotification, UIImagePickerControllerDelegate, UINavigationControllerDelegate,CalendarViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblTitleHeader;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *viewContentForm;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnAddImagePofile;

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UITextForm *txtFormName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastName;
@property (weak, nonatomic) IBOutlet UITextForm *txtFormLastName;
@property (weak, nonatomic) IBOutlet UILabel *lblBirthdate;
@property (weak, nonatomic) IBOutlet UITextForm *txtFormBirthdate;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UITextForm *txtFormAddress;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@property (strong, nonatomic) HomeInteractor *interactor;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setStyle];
    [self setData];
}

#pragma mark - View Will Layout Subviews

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width, _viewContentForm.frame.size.height)];
}

#pragma mark - Set Style

-(void)setStyle
{
    [_viewHeader setBackgroundColor:[Colors gray192Color]];
    [Styles setLabelTitleHeader:_lblTitleHeader];
    [Styles setLabelTitle:_lblTitle];
    [Styles setViewCircular:_imgViewProfile];
    [Styles setButtonGenericaAlternate:_btnAddImagePofile];
    
    [Styles setLabelSubTitle:_lblName];
    [_txtFormName setScrollView:_scrollView];
    [Styles setLabelSubTitle:_lblLastName];
    [_txtFormLastName setScrollView:_scrollView];
    [Styles setLabelSubTitle:_lblBirthdate];
    [_txtFormBirthdate setScrollView:_scrollView];
    [Styles setLabelSubTitle:_lblAddress];
    [_txtFormAddress setScrollView:_scrollView];
    [Styles setButtonGeneric:_btnSave];
    
    _interactor = [[HomeInteractor alloc] init];
}

#pragma mark - Set Data

-(void)setData
{
    [_lblTitleHeader setText:NSLocalizedString(@"titleHeader", @"")];
    [_scrollView addSubview:_viewContentForm];
    [_lblTitle setText:NSLocalizedString(@"titleHome", @"")];
    [_btnAddImagePofile setTitle:NSLocalizedString(@"btnSelectImage", @"") forState:UIControlStateNormal];
    
    [_lblName setText:NSLocalizedString(@"name", @"")];
    [_lblLastName setText:NSLocalizedString(@"lastName", @"")];
    [_lblBirthdate setText:NSLocalizedString(@"birthday", @"")];
    [_lblAddress setText:NSLocalizedString(@"address", @"")];
    [_btnSave setTitle:NSLocalizedString(@"btnSave", @"") forState:UIControlStateNormal];
}

#pragma mark - Calendar delegate

-(void)dateCalendar:(NSString*)date
{
    [_txtFormBirthdate setText:date];
}

#pragma mark - IBAction

-(IBAction)buttonSave:(id)sender
{
    if([_interactor getValidationWithName:_txtFormName LastName:_txtFormLastName Birthday:_txtFormBirthdate andAddress:_txtFormAddress])
    {}
}

-(IBAction)buttonCalendar:(id)sender
{
    [_txtFormBirthdate clearTextFieldValidation];
    CalendarViewController *vc = [[CalendarViewController alloc] init];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

-(IBAction)buttonAddImageProfile:(id)sender
{
    //handle Tap...
    if(![AskPermissionsViewController haveCameraPermission])
    {
        AskPermissionsViewController *askPerVC = [[AskPermissionsViewController alloc] initWithNibName:@"AskPermissionsViewController" bundle:[NSBundle mainBundle]];
        askPerVC.type = PermissionTypeCamera;
        [askPerVC setSuccess:^{
            [self openCamaraOrLibraryPhoto];
        }];
        askPerVC.modalPresentationStyle = UIModalPresentationFullScreen;
        askPerVC.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:askPerVC animated:YES completion:nil];
    }else
        [self openCamaraOrLibraryPhoto];
}

#pragma mark - Image Action Button

-(void)openCamaraOrLibraryPhoto {
    ActionSheets *action = [[ActionSheets alloc]init];
    action.delegate = self;
    [action showActionSheet:self];
}

#pragma mark - Alerts Protocols
-(void)optionSelectedFromAction:(ActionSheet)act
{
    switch (act) {
        case ActionSheetCancel:
            NSLog(@"Cancel");
            break;
        case ActionSheetFromLibrary:
            NSLog(@"library");
            [self takePictureFromLibrary];
            break;
        case ActionSheetTakePicture:
            NSLog(@"Camera");
            [self takePictureFromCamera];
        default:
            break;
    }
}

#pragma mark - Photo Logic
-(void)takePictureFromLibrary
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)takePictureFromCamera
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - ImagePicker Logic
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *cameraImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    [_imgViewProfile setImage:cameraImage];
    [picker dismissViewControllerAnimated:YES completion:nil];}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
