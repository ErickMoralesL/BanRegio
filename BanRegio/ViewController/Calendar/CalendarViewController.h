//
//  CalendarViewController.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalendarViewControllerDelegate
@required
-(void)dateCalendar:(NSString*)date;
@end

@interface CalendarViewController : UIViewController

@property (weak, nonatomic) id <CalendarViewControllerDelegate> delegate;

@end
