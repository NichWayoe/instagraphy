//
//  HomeFeedViewController.m
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/6/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "HomeFeedViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "DetailViewController.h"
#import "SceneDelegate.h"
#import "PostCell.h"

@interface HomeFeedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *posts;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeFeedViewController

- (IBAction)onTapCamera:(id)sender
{
    [self performSegueWithIdentifier:@"secondsegue" sender:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.posts = [NSMutableArray new];
    [self postFetcher];
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(postFetcher) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

- (void)postFetcher
{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = (NSMutableArray *) posts;
            NSLog(@"%@",posts);
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
            
    } else{
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (IBAction)onLogout:(id)sender
{
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    myDelegate.window.rootViewController = loginViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    PostCell *cell= [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    cell.post = self.posts[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier  isEqual: @"detailViewSegue"]){
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    Post *tappedPost = self.posts[indexPath.row];
    DetailViewController *detailViewController =[segue destinationViewController];
    detailViewController.tappedPost = tappedPost;
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];}
}
@end
