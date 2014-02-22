//
//  BCBlogPost.h
//  BlogReader
//
//  Created by Bernie Chiu on 2014/2/22.
//  Copyright (c) 2014年 Bernie Chiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCBlogPost : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSURL *url;

- (NSString *)formattedDate;

// Designated Initializer
- (id)initWithTitle:(NSString *)title atDate:(NSString *)date;
+ (id)BCBlogPostWithTitle:(NSString *)title atDate:(NSString *)date;

@end
