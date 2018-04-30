//
//  TutorialViewController.h
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 30/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController <UIScrollViewDelegate>
@property(nonatomic, strong) NSArray *config;
-(void) setConfiguration:(NSArray*)dataArray;
@end

