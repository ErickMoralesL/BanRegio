//
//  TutorialViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 30/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()
{
    float valueScrollWidth;
    float valueScrollHeight;
}

@property (weak, nonatomic) IBOutlet UIButton *btnSkip;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnAccept;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;

@end

@implementation TutorialViewController

@synthesize config;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setData];
    [self setStyles];
}

#pragma mark - Set Styles
-(void)setStyles
{
    [Styles setLabelTitle:_lblTitle];
    [Styles setLabelSubTitle:_lblDetail];
    [Styles setButtonGeneric:_btnAccept];
}

#pragma mark - Set Data

-(void)setData
{
    [_btnSkip setHidden:YES];
    _scrollView.delegate = self;
    [_scrollView setPagingEnabled:YES];
    [_btnAccept setTitle:NSLocalizedString(@"btnAcept", @"") forState:UIControlStateNormal];
    [_lblTitle setText:NSLocalizedString(@"tutorial", @"")];
}

#pragma mark - set data

-(void) setConfiguration:(NSArray*)dataArray
{
    [_lblDetail setText:dataArray[0]];
    
    config = dataArray;

    [_pageController setNumberOfPages:dataArray.count];

    valueScrollWidth = [[UIScreen mainScreen] bounds].size.width;
    valueScrollHeight = [[UIScreen mainScreen] bounds].size.height;

    _scrollView.alwaysBounceVertical = NO;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
}

#pragma mark - viewDidLayoutSubview

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [_scrollView setContentSize:CGSizeMake(valueScrollWidth*3, valueScrollHeight)];
}

#pragma mark - Button Remove

-(IBAction)buttonRemove:(id)sender
{
    self.navigationController.modalPresentationStyle = UIModalTransitionStyleCoverVertical;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - changeScreen

-(IBAction)changeScreen:(id)sender
{
    [_scrollView scrollRectToVisible:CGRectMake(valueScrollWidth*_pageController.currentPage, _scrollView.frame.origin.y, valueScrollWidth, _scrollView.frame.size.height) animated:YES];
}

#pragma mark - Delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self setupAfterScroll:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self setupAfterScroll:scrollView];
}

-(void) setupAfterScroll:(UIScrollView*)scrollView
{
    CGFloat pageWidth = scrollView.bounds.size.width;
    NSInteger pageNumber = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageController.currentPage = pageNumber;
    [_lblDetail setText:config[pageNumber]];
    
    if(pageNumber == config.count-1)
    {
        [_btnSkip setHidden:NO];
        [_btnAccept setHidden:YES];
    }else{
        [_btnSkip setHidden:YES];
        [_btnAccept setHidden:NO];
    }
}

- (IBAction)skipSection:(id)sender
{
        valueScrollWidth = [[UIScreen mainScreen] bounds].size.width;
        [_scrollView setContentOffset:CGPointMake(valueScrollWidth*(config.count-1), 0) animated:YES];
}

@end
