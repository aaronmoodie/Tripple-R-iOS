//
//  ShowObject.m
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import "ShowModel.h"

@implementation ShowModel

+ (instancetype)showWithJson:(NSDictionary *)jsonDictionary {
    ShowModel *newShow = [[ShowModel alloc] init];
    
    newShow.title = jsonDictionary[@"title"];
    newShow.hosts = jsonDictionary[@"hosts"];
    newShow.duration = [jsonDictionary[@"duration"] integerValue];
    newShow.dayAndTimes = jsonDictionary[@"show_times"];
    
    // Check for image URL
    NSString *imageUrlString = jsonDictionary[@"img_url"];
    if (imageUrlString.length) {
        newShow.imageUrl = [NSURL URLWithString:imageUrlString];
    }
    
    return newShow;
}

+ (NSArray *)showsWithJson:(NSData *)jsonData {
    NSMutableArray *shows = [NSMutableArray array];
    NSArray *showsArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        
    for (NSDictionary *show in showsArray) {
        ShowModel *newShow = [ShowModel showWithJson:show];
        [shows addObject:newShow];
    }
    
    return [shows copy];
}

// Create Array of date objects for show times
+ (NSArray *)showDatesFromTimes:(NSArray *)dayAndTimes {
    NSMutableArray *showDates = [NSMutableArray array];
//    NSDate *now = [NSDate date];
    
    /*
     
     Create Array of date objects
     
     For each time in dayAndTimes, create the next future corrosponding date
         populate an arry of that day for every week for 3 months past
         slice array from now to first date
         add to showDates array
     
     order showDates by date
     */
    
    return [showDates copy];
}

@end
