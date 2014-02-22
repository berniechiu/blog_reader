//
//  BCWebViewController.h
//  BlogReader
//
//  Created by Bernie Chiu on 2014/2/22.
//  Copyright (c) 2014年 Bernie Chiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCWebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
