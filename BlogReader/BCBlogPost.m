//
//  BCBlogPost.m
//  BlogReader
//
//  Created by Bernie Chiu on 2014/2/22.
//  Copyright (c) 2014年 Bernie Chiu. All rights reserved.
//

#import "BCBlogPost.h"

@implementation BCBlogPost

- (id)initWithTitle:(NSString *)title atDate:(NSString *)date {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.date = date;
        self.url = nil;
    }
    
    return self;
}

+ (id)BCBlogPostWithTitle:(NSString *)title atDate:(NSString *)date {
    return [[self alloc] initWithTitle:title atDate:date];
}

- (NSString *)formattedDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"];
    NSDate *date  = [dateFormatter dateFromString:self.date];
    
    // Convert to new Date Format
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *newDate = [dateFormatter stringFromDate:date];
    
    return newDate;
}

@end
