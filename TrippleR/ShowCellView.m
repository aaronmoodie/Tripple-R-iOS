//
//  ShowCellView.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "ShowCellView.h"

@interface ShowCellView ()

@property (nonatomic, strong) UIImageView *showImageView;

@end

@implementation ShowCellView

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    [self commonInitialization];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) { return nil; }
    
    [self commonInitialization];
    return self;
}

- (void)commonInitialization {
    
    // Set up show title label
    self.showTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.showTitleLable.textColor = [UIColor blackColor];
    [self.showTitleLable setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
    self.showTitleLable.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Set up show hosts label
    self.showHostsLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.showHostsLable.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.showHostsLable setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    self.showHostsLable.translatesAutoresizingMaskIntoConstraints = NO;
    
    // set up show image
    self.showImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.showImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.showImageView setClipsToBounds:YES];
    self.showImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // add subview
    [self addSubview:self.showImageView];
    [self addSubview:self.showTitleLable];
    [self addSubview:self.showHostsLable];
        
    //
    //  Positioning
    //
    
    NSString *visualFormat = @"|-0-[_showImageView(==65)]";
    NSDictionary *views = NSDictionaryOfVariableBindings(_showImageView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"V:|-0-[_showImageView(==65)]";
    views = @{@"_showImageView": _showImageView};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"|-80-[_showTitleLable]";
    views = @{@"_showTitleLable": _showTitleLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"|-80-[_showHostsLable]";
    views = @{@"_showHostsLable": _showHostsLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"V:|-15-[_showTitleLable]-4-[_showHostsLable]";
    views = @{@"_showHostsLable": _showHostsLable, @"_showTitleLable": _showTitleLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
}

- (void)setShowImageURL:(NSURL *)showImageURL {
    _showImageURL = showImageURL;
    
    // Fetch images from RRR
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:_showImageURL];
    [NSURLConnection sendAsynchronousRequest:imageRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               UIImage *image = [UIImage imageWithData:data];
                               self.showImageView.image = image;
                           }];
}

@end
