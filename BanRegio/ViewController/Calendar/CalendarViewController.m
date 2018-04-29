//
//  CalendarViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()<FSCalendarDelegate, FSCalendarDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStyle];
    [self setData];
}

#pragma mark - Set Style

-(void)setStyle
{
    [Styles setLabelTitle:_lblTitle];
    [Styles setBorderForView:_viewContent];
}

#pragma mark - Set Data

-(void)setData
{
    [_lblTitle setText:NSLocalizedString(@"calendar", @"")];
    _calendar.delegate = self;
}

#pragma mark - IBAction

-(IBAction)buttonClose:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - FSCalendar

-(void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    [_delegate dateCalendar:[Utils getConvertStringToDateCalendar:date]];
}

@end
