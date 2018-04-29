//
//  UITextForm.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 24/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "UITextForm.h"

@implementation UITextForm
{
    CALayer *bottomBorder;
    UIToolbar* numberToolbar;
    UIScrollView *scroll;
    BOOL isPicker;
    BOOL deleteBottomLine;
}

@synthesize idState;
@synthesize forceToScroll;
@synthesize messureY;
@synthesize isFieldEditing;
@synthesize scrollToTop;
@synthesize delegateTextForm;

#pragma mark -Init
-(id)init
{
    if(self == [super init])
    {
        //init setup
        self.delegate = self;
    }
    isPicker = false;
    deleteBottomLine = true;
    forceToScroll = false;
    isFieldEditing = false;
    if(IS_IPHONE_5){
        messureY = 20;
    }
    else{
        messureY = 15;
    }
    scrollToTop = YES;
    return self;
}

#pragma mark -Custom Init
-(id)initWithWhiteBorder
{
    if (self = [super init])
    {
        
        self.delegate = self;
        [self basicSetup];
    }
    
    return self;
}

#pragma mark -Init From Xib/Nib

-(id)initWithCoder:(NSCoder *)inCoder
{
    if (self = [super initWithCoder:inCoder])
    {
        NSLog(@"TextField Created");
        self.delegate = self;
        [self basicSetup];
        [self registerForKeyboardNotifications];
    }
    return self;
}

#pragma mark - Keyboard Notifications
-(void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

+(void)deregisterFromKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

#pragma mark -Init Setup

-(void)basicSetup
{
    
    bottomBorder = [CALayer layer];
    
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.layer setBorderColor:[UIColor grayColor].CGColor];
    self.layer.borderWidth = 1;
    self.layer.masksToBounds = YES;
    
    [self setReturnKeyType:UIReturnKeyDone];
    [self setBorderStyle:UITextBorderStyleNone];
    [self setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    [self setTextColor:[UIColor blackColor]];
    [self setFont:[UIFont systemFontOfSize:12]];
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.leftViewMode = UITextFieldViewModeAlways;
    
    [self.layer setCornerRadius:6];
    //[self setClipsToBounds:YES];
    bottomBorder.backgroundColor = [UIColor blackColor].CGColor;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, self.frame.size.height)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    [self setupToolbar];
}

-(void)removeWhiteBottomLine{
    [bottomBorder removeFromSuperlayer];
    deleteBottomLine = true;
}

-(void)setupToolbar
{
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    
    numberToolbar.barStyle = UIBarButtonItemStylePlain;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:[NSString stringWithFormat:@"Done"] style:UIBarButtonItemStyleDone target:self action:@selector(doneToolbar)],
                           nil];
    [numberToolbar sizeToFit];
    self.inputAccessoryView = numberToolbar;
}

#pragma mark - Toolbar Actions
-(void)doneToolbar
{
    [self resignFirstResponder];
    [delegateTextForm keyboardOff];
}

#pragma mark -Customization
+(void)setPlaceHolder:(NSString *)placeHolderString
{
    [self setPlaceHolder:placeHolderString];
}

#pragma mark -Delegates & Protocols

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    
    if (textField.returnKeyType != UIReturnKeyNext) {
        [delegateTextForm textFieldReturnGoOrDone];
    }
    
    
    return NO; // We do not want UITextField to insert line-breaks.
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    [self resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    isFieldEditing = true;
}

-(void)clearTextFieldValidation
{
    [self.layer setBorderColor:[UIColor grayColor].CGColor];
    [lblErrorMessage removeFromSuperview];
    lblErrorMessage = nil;
}

#pragma mark -Validations Results
-(void)showValidationError:(NSString*)errorMessage
{
    [self clearTextFieldValidation];
    
    [self.layer setBorderColor:[UIColor redColor].CGColor];
    
    lblErrorMessage = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 2, self.frame.size.width, 25)];
    [lblErrorMessage setTextAlignment:NSTextAlignmentRight];
    [lblErrorMessage setFont:[UIFont systemFontOfSize:11]];
    [lblErrorMessage setTextColor:[UIColor redColor]];
    lblErrorMessage.text = errorMessage;
    
    lblErrorMessage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 animations:^
     {
         self->lblErrorMessage.alpha = 1.0;
     }];
    
    [Animations viewVibrateAnimationForItem:self];
    
    [self addSubview:lblErrorMessage];
}

-(void)showValidationErrorWide:(NSString*)errorMessage{
    
    //    [self clearTextFieldValidation];
    
    self.layer.borderWidth = 1.0f;
    
    lblErrorMessage = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height, 100, 25)];
    lblErrorMessage.text = errorMessage;
    lblErrorMessage.alpha = 0.0;
    
    [UIView animateWithDuration:1.0 animations:^
     {
         self->lblErrorMessage.alpha = 1.0;
     }];
    
    [self addSubview:lblErrorMessage];
}

#pragma mark - Auto Adjust Keyboard
-(void)setScrollView:(UIScrollView *)scrollView
{
    scroll = scrollView;
}

- (void)keyboardWasShown:(NSNotification *)notification
{
    [self clearTextFieldValidation];
    if(!isFieldEditing){return;}
    
    if(isPicker == YES && [self.text isEqualToString:@""] && pickerData.count > 0){
        self.text = pickerData[0];
    }
    NSLog(@"Keyboard On");
    NSDictionary* info = [notification userInfo];
    
    CGSize keyboardSize;
    
    if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){.majorVersion = 11, .minorVersion = 0, .patchVersion = 0}]){
        keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    }else{
        keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    }
    
    CGPoint buttonOrigin = self.frame.origin;
    CGFloat textHeight;
    
    if(IS_IPHONE_5){
        textHeight = self.frame.size.height + messureY;
    }
    else{
        textHeight = self.frame.size.height + messureY;
    }
    
    CGRect visibleRect = scroll.frame;
    
    visibleRect.size.height -= (keyboardSize.height+textHeight);
    
    if (!CGRectContainsPoint(visibleRect, buttonOrigin) || forceToScroll){
        
        CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + textHeight);
        
        [scroll setContentOffset:scrollPoint animated:YES];
    }
    isFieldEditing = false;
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    NSLog(@"Keyboard Off");
    NSDictionary* info = [notification userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    
    // resize the scrollview
    CGRect viewFrame = scroll.frame;
    CGFloat textHeight;
    
    if(IS_IPHONE_5){
        textHeight = self.frame.size.height + messureY;
    } else {
        textHeight = self.frame.size.height + messureY;
    }
    viewFrame.size.height += (keyboardSize.height - textHeight);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [scroll setFrame:viewFrame];
    [UIView commitAnimations];
}

-(void)hideClearButton{
    self.clearButtonMode = UITextFieldViewModeNever;
}

@end
