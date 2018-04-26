//
//  UITextForm.h
//  KokoTemplate
//
//  Created by Sergio on 11/29/17.
//  Copyright © 2017 Kokonut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAXLENGTH 50
#define MAXZIPCODE 5
#define MAXPHONE3 3
#define MAXPHONE4 4

@protocol TextFieldFormDelegate <NSObject>
@required
-(void)textFieldReturnGoOrDone;
-(void)keyboardOff;
@end

@interface UITextForm : UITextField <UITextFieldDelegate>
{
    UILabel *lblErrorMessage;
    UIPickerView *pickerView;
    UIDatePicker *datePicker;
    NSArray *pickerData;
}

@property BOOL forceToScroll;
@property int messureY;
@property BOOL isFieldEditing;
@property(strong, nonatomic)NSString * _Nonnull idState;
@property(nonatomic, assign) BOOL scrollToTop;

NS_ASSUME_NONNULL_BEGIN
@property(nonatomic,weak)id <TextFieldFormDelegate>delegateTextForm;
NS_ASSUME_NONNULL_END

#pragma mark - Register for Keyboard Notifications;
+(void)deregisterFromKeyboardNotifications;

//All the method to use in every tex field.
+(void)setPlaceHolder:(nonnull NSString*)placeHolderString;
-(void)setScrollView:(nonnull UIScrollView*)scrollView;
-(void)showValidationError:(nonnull NSString*)errorMessage;
-(void)showValidationErrorWide:(nonnull NSString*)errorMessage;
-(void)removeWhiteBottomLine;
-(void)hideClearButton;
-(void)clearTextFieldValidation;

@end
