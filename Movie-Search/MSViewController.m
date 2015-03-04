//
//  MSViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSViewController.h"
#import "MSResponseTableViewDataSource.h"
#import "MSMovieDetailViewController.h"
#import "MovieController.h"

@interface MSViewController () <UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *searchField;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MSResponseTableViewDataSource *dataSource;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.dataSource = [MSResponseTableViewDataSource new];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

}

- (IBAction)search:(id)sender {
    [[MovieController sharedInstance]moviesWithTitle:self.searchField.text completion:^(BOOL success) {
        if (success) {
            [self.tableView reloadData];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Search not found." message:@"Search again." delegate:nil cancelButtonTitle:@"Fine!" otherButtonTitles:nil] show];
        }
    }];
    
    [self.searchField resignFirstResponder];
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MSMovieDetailViewController *detailViewController = [MSMovieDetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
