//
//  LiveShowCell.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "LiveShowView.h"
#import "UIImageEffects.h"

@interface LiveShowView ()

@property (nonatomic, strong) UIImageView *showImageView;

@end

@implementation LiveShowView

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
    
    [self setBackgroundColor:[UIColor colorWithRed:(241/255.0) green:(241/255.0) blue:(241/255.0) alpha:1]];
    
    // Set up show title label
    self.showTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.showTitleLable.textColor = [UIColor whiteColor];
    [self.showTitleLable setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
    [self.showTitleLable setTextAlignment:NSTextAlignmentCenter];
    self.showTitleLable.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Set up show hosts label
    self.showHostsLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.showHostsLable.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.showHostsLable setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    [self.showHostsLable setTextAlignment:NSTextAlignmentCenter];
    self.showHostsLable.translatesAutoresizingMaskIntoConstraints = NO;
    
    // set up show image
    self.showImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.showImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.showImageView setClipsToBounds:YES];
    self.showImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // create cell seporater
    UIView *cellSeporator = [[UIView alloc] initWithFrame:CGRectZero];
    cellSeporator.backgroundColor = [UIColor whiteColor];
    cellSeporator.translatesAutoresizingMaskIntoConstraints = NO;
    
    // add subview
    [self addSubview:self.showImageView];
    [self addSubview:self.showTitleLable];
    [self addSubview:self.showHostsLable];
    [self addSubview:cellSeporator];
    
    
    //
    //  Positioning
    //
    
    NSString *visualFormat = @"|-0-[_showImageView]-0-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(_showImageView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"V:|-0-[_showImageView]-0-|";
    views = @{@"_showImageView": _showImageView};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"|-0-[_showTitleLable]-0-|";
    views = @{@"_showTitleLable": _showTitleLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"|-0-[_showHostsLable]-0-|";
    views = @{@"_showHostsLable": _showHostsLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"V:|-20-[_showTitleLable]-2-[_showHostsLable]";
    views = @{@"_showHostsLable": _showHostsLable, @"_showTitleLable": _showTitleLable};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"|-0-[cellSeporator]-0-|";
    views = @{@"cellSeporator": cellSeporator};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self addConstraints:constraints];
    
    visualFormat = @"V:[cellSeporator(==1)]-0-|";
    views = @{@"cellSeporator": cellSeporator};
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
                               self.showImageView.image = [UIImageEffects imageByApplyingDarkEffectToImage:image];
                           }];
}

@end
