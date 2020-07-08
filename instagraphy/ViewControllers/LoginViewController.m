//
//  LoginViewController.m
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/6/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onLogin:(id)sender
{
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
          if (error != nil) {
              NSLog(@"User log in failed: %@", error.localizedDescription);
          } else {
              NSLog(@"User logged in successfully");
               [self performSegueWithIdentifier:@"firstsegue" sender:nil];
          }
      }];
}

- (IBAction)onSignUp:(id)sender
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");

            }
        }];
}
@end
