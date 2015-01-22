//
//  PlayingViewController.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "PlayingViewController.h"

@interface PlayingViewController ()

@property (nonatomic, strong) UIView *playingView;

@end

@implementation PlayingViewController

- (id)init {
    self = [super init];
    if (!self) { return nil; }
    
    self.title = @"Playing";
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playingView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.playingView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.playingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
