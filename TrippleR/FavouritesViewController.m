//
//  FavouritesViewController.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/17/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "FavouritesViewController.h"

@interface FavouritesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FavouritesViewController

- (id)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.title = @"Favourites";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"trackCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Favourite %d", (int)indexPath.row];
    return  cell;
}

@end
