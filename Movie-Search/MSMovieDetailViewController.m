//
//  MSMovieDetailViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSMovieDetailViewController.h"
#import "MovieController.h"
#import "MSResponseTableViewDataSource.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MSMovieDetailViewController ()


@end

@implementation MSMovieDetailViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    MSResponseTableViewDataSource *dataSource = [MSResponseTableViewDataSource new];
    //NSInteger indexPath = [MSResponseTableViewDataSource].c
    NSDictionary *movie = [MovieController sharedInstance].resultMovies[dataSource.cellSelected];
    self.titleLabel.text = movie[@"title"];
    self.dateLabel.text = movie[@"release_date"];
    self.descriptionLabel.text = movie[@"description"];
    
    [self.posterImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92/%@", movie[@"poster_path"] ]]];
}

@end



//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseKey];
//if (!cell) {
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellReuseKey];
//}
//
//NSDictionary *movie = [MovieController sharedInstance].resultMovies[indexPath.row];
//cell.textLabel.text = movie[@"title"];
//cell.detailTextLabel.text = movie[@"release_date"];
//
//[cell.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92/%@", movie[@"poster_path"] ]]];