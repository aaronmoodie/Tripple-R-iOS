//
//  ShowObject.h
//  TrippleR
//
//  Created by Aaron Moodie on 11/20/14.
//  Copyright (c) 2014 Aaron Moodie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *hosts;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, copy) NSURL *imageUrl;
@property (nonatomic, copy) NSArray *dayAndTimes;

+ (instancetype)showWithJson:(NSDictionary *)jsonDictionary;
+ (NSArray *)showsWithJson:(NSData *)jsonData;
+ (NSArray *)showDatesFromTimes:(NSArray *)dayAndTimes;

@end
