//
//  TableViewController.m
//  BlogReader
//
//  Created by Bernie Chiu on 2014/2/21.
//  Copyright (c) 2014年 Bernie Chiu. All rights reserved.
//

#import "TableViewController.h"

#import "BCBlogPost.h"

#import "BCWebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    
    NSURL *blogURL = [NSURL URLWithString:@"http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=8&q=http%3A%2F%2Fmhperng.blogspot.com%2Ffeeds%2Fposts%2Fdefault"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [[[dataDictionary objectForKey:@"responseData"] objectForKey:@"feed" ] objectForKey:@"entries"];
    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        BCBlogPost *blogPost = [BCBlogPost BCBlogPostWithTitle:[bpDictionary objectForKey:@"title"] atDate:[bpDictionary valueForKey:@"publishedDate"]];
        
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"link"]];
        [self.blogPosts addObject:blogPost];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BCBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"出版日期：%@", [blogPost formattedDate]];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BCBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

@end
