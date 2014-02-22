//
//  BCWebViewController.m
//  BlogReader
//
//  Created by Bernie Chiu on 2014/2/22.
//  Copyright (c) 2014年 Bernie Chiu. All rights reserved.
//

#import "BCWebViewController.h"

@interface BCWebViewController ()

@end

@implementation BCWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
	[self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
