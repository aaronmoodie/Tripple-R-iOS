//
//  ShowViewController.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "ShowViewController.h"
#import "ShowCellView.h"

@interface ShowViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ShowModel *show;
@property (nonatomic, strong) ShowCellView *showCellView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) NSArray *showDatesArray;

@end

@implementation ShowViewController {
    @private
    ShowModel *_show;
}

- (instancetype)initWithShow:(ShowModel *)show {
    self = [super init];
    if (!self) { return nil; }
    
    // We do this to set the property value directly and avoid
    // calling any property accessor methods.
    _show = show;
    
    self.title = @"Listen";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showDatesArray = [ShowModel showDatesFromTimes:self.show.dayAndTimes];
    
    // Set up tabel view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"trackCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    // Set up tableHeader
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 640, 65)];
    self.tableHeaderView.backgroundColor = [UIColor colorWithRed:(241/255.0) green:(241/255.0) blue:(241/255.0) alpha:1];
    
    // Add table Header to tableView
    [self.tableView setTableHeaderView:self.tableHeaderView];
    
    // Set up Show Cell
    self.showCellView = [[ShowCellView alloc] initWithFrame:CGRectZero];
    self.showCellView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.showCellView.showTitleLable.text = self.show.title;
    self.showCellView.showHostsLable.text = [NSString stringWithFormat:@"with %@", [self.show.hosts componentsJoinedByString:@", "]];
    self.showCellView.showImageURL = self.show.imageUrl;
    
    // Add cell to header
    [self.tableHeaderView addSubview:self.showCellView];
    

}

// Set number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

// Return cell for Row at i
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackCell"];
    return cell;
}

@end
