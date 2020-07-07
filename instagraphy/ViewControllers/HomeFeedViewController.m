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
#import "SceneDelegate.h"
@interface HomeFeedViewController ()

@end


@implementation HomeFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (IBAction)onLogout:(id)sender
{
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    myDelegate.window.rootViewController = loginViewController;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];

}

@end
