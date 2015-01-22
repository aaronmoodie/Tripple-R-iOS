//
//  TabViewController.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/17/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "TabViewController.h"

#import "FavouritesViewController.h"
#import "ShowsViewController.h"
#import "PlayingViewController.h"

@interface TabViewController ()

@property (nonatomic, strong) FavouritesViewController *favouritesView;
@property (nonatomic, strong) UINavigationController *favouritesNavView;

@property (nonatomic, strong) ShowsViewController *showsView;
@property (nonatomic, strong) UINavigationController *showsNavView;

@property (nonatomic, strong) PlayingViewController *playingView;
@property (nonatomic, strong) UINavigationController *playingNavView;

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    self.favouritesView = [[FavouritesViewController alloc] init];
    self.favouritesNavView = [[UINavigationController alloc] initWithRootViewController:self.favouritesView];
    self.favouritesNavView.navigationBar.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.favouritesNavView.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.showsView = [[ShowsViewController alloc] init];
    self.showsNavView = [[UINavigationController alloc] initWithRootViewController:self.showsView];
    self.showsNavView.navigationBar.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.showsNavView.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.playingView = [[PlayingViewController alloc] init];
    self.playingNavView = [[UINavigationController alloc] initWithRootViewController:self.playingView];
    self.playingNavView.navigationBar.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.playingNavView.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    
    NSArray *viewControllers = @[self.favouritesNavView,
                                 self.showsNavView,
                                 self.playingNavView];
    
    [self setViewControllers:viewControllers];
    [self setSelectedIndex: 1];
}

- (void)viewWillAppear:(BOOL)animate {
    [super viewWillAppear:animate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
