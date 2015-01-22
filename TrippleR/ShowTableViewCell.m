//
//  ShowCell.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/19/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "ShowTableViewCell.h"

@interface ShowTableViewCell ()

@end

@implementation ShowTableViewCell

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    [self commonInitialization];
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) { return nil; }
    
    [self commonInitialization];
    return self;
}

- (void)commonInitialization {
    
    // Set up Show Cell
    self.showCellView = [[ShowCellView alloc] initWithFrame:CGRectZero];
    self.showCellView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:self.showCellView];
    
    //
    //  Positioning
    //
    
    NSString *visualFormat = @"|-0-[_showCellView]-0-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(_showCellView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self.contentView addConstraints:constraints];
    
    visualFormat = @"V:|-0-[_showCellView]-0-|";
    views = @{@"_showCellView": _showCellView};
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:views];
    
    [self.contentView addConstraints:constraints];

}

- (void)setShowViewTitle:(NSString *)title Hosts:(NSString *)hosts URL:(NSURL *)url {
        
    //    cell.showTitle.text = title;
    //    cell.showImageURL = [[NSURL alloc] initWithString:show[@"img_url"]];
    //    cell.showHosts.text = [NSString stringWithFormat:@"with %@", [hosts componentsJoinedByString:@", "]];
}


- (void)awakeFromNib {
    // Initialization code
}


@end
