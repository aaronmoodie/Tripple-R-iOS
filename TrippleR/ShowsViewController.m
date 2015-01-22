//
//  ShowsViewController.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/18/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "ShowsViewController.h"
#import "ShowViewController.h"
#import "ShowTableViewCell.h"
#import "LiveShowView.h"
#import "ShowModel.h"

@interface ShowsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) NSArray *showsArray;

@end

@implementation ShowsViewController

- (id)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.title = @"Shows";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Set up tabel view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"trackCell"];
    self.tableView.rowHeight = 65;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Set up 'on the air' content
    LiveShowView *onTheAir = [[LiveShowView alloc] initWithFrame:CGRectZero];
    onTheAir.showTitleLable.text = @"Banana Lounge Broadcasting";
    onTheAir.showHostsLable.text = @"with Dave Graney & Kate Kingsmill";
    onTheAir.showImageURL = [[NSURL alloc] initWithString:@"http://www.rrr.org.au/assets/banana-lounge-broadcasting-130-x-130.jpg"];
    onTheAir.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Set up tableHeader
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 640, 115)];
    self.tableHeaderView.backgroundColor = [UIColor lightGrayColor];
    
    // Add content to header
    [self.tableHeaderView addSubview:onTheAir];
    
    // Add table Header to tableView
    [self.tableView setTableHeaderView:self.tableHeaderView];

    // Remove tabelCell seperator
    if ([self.tableView respondsToSelector:@selector(setSeparatorStyle:)]) {
//        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    
    // Import JSON and create Array
    NSString *jsonFile = [[NSBundle mainBundle]  pathForResource:@"rrrProgram" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFile];
    self.showsArray = [ShowModel showsWithJson:jsonData];
    
    // Add table to ShowsView
    [self.view addSubview:self.tableView];
    
    
    //
    //  Positioning
    //
    
    NSString *visualFormat = @"|-0-[onTheAir]-0-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(onTheAir);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self.tableHeaderView addConstraints:constraints];
    
    visualFormat = @"V:|-0-[onTheAir]-0-|";
    views = @{@"onTheAir": onTheAir};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self.tableHeaderView addConstraints:constraints];
    
}

// Set number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.showsArray.count;
}

// Return cell for Row at i
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShowModel *show = self.showsArray[indexPath.row];
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackCell"];
    
    cell.showCellView.showTitleLable.text = show.title;
    cell.showCellView.showHostsLable.text = [NSString stringWithFormat:@"with %@", [show.hosts componentsJoinedByString:@", "]];
    cell.showCellView.showImageURL = show.imageUrl;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ShowModel *show = self.showsArray[indexPath.row];
    ShowViewController *showViewController = [[ShowViewController alloc] initWithShow:show];
    [self.navigationController pushViewController:showViewController
                                         animated:YES];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle  {
    return UIStatusBarStyleLightContent;
}

@end
