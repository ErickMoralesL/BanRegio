//
//  MenuViewController.m
//  BanRegio
//
//  Created by Erick Alberto Morales Ledesma on 29/04/18.
//  Copyright © 2018 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileTableViewCell.h"
#import "SectionTableViewCell.h"
#import "MenuInteractor.h"

#define CELL_PROFILE @"profileCell"
#define CELL_SECTION @"sectionCell"

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MenuInteractor *interactor;
@property (strong, nonatomic) RealmInteractor *realm;


@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
}

#pragma mark - Set Data

-(void)setData
{
    _interactor = [[MenuInteractor alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView registerNib:[UINib nibWithNibName:@"ProfileTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CELL_PROFILE];
    [_tableView registerNib:[UINib nibWithNibName:@"SectionTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CELL_SECTION];
}

#pragma mark - TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_interactor getContentMenu] + 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
        return [tableView dequeueReusableCellWithIdentifier:CELL_PROFILE].frame.size.height;
    else
        return [tableView dequeueReusableCellWithIdentifier:CELL_SECTION].frame.size.height;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 0.0)];
    
    viewHeader.backgroundColor = [UIColor clearColor];
    
    return viewHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        static NSString *cellIDentifier = CELL_PROFILE;

        ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor clearColor]];        return cell;
    }else{
        static NSString *cellIDentifier = CELL_SECTION;

        SectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDentifier];

        if(!cell)
        {
            cell = [[SectionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDentifier];
        }

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor clearColor]];

        [_interactor initCellForCell:cell andPosition:indexPath.section];

        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_interactor navigationForPositionDidSelect:indexPath.section andSWRevealVireController:[self revealViewController]];
}

@end
