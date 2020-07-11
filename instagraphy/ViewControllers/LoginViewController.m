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
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginButton.enabled = NO;
    self.signUpButton.enabled = NO;
}

- (IBAction)onLogin:(id)sender
{
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
          if (error != nil) {
              NSLog(@"User log in failed: %@", error.localizedDescription);
              UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Failed"
                     message:error.localizedDescription
              preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"try again"
                     style:UIAlertActionStyleDefault
                                       
                   handler:^(UIAlertAction * _Nonnull action) {
                   }];
              [alert addAction:okAction];
                 [self presentViewController:alert animated:YES completion:^{
                 }];
          } else {
              NSLog(@"User logged in successfully");
               [self performSegueWithIdentifier:@"homeFeedSegue" sender:nil];
          }
      }];
}

- (IBAction)onActivateLoginButton:(id)sender
{
        self.loginButton.enabled = YES;
        self.signUpButton.enabled = YES;
}

- (IBAction)onSignUp:(id)sender
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign Up Failed"
                               message:error.localizedDescription
                        preferredStyle:(UIAlertControllerStyleAlert)];
                          UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"try again"
                               style:UIAlertActionStyleDefault
                                                 
                             handler:^(UIAlertAction * _Nonnull action) {
                             }];
                        [alert addAction:okAction];
                           [self presentViewController:alert animated:YES completion:^{
                           }];
        } else {
            NSLog(@"User registered successfully");
            [self performSegueWithIdentifier:@"homeFeedSegue" sender:nil];
            
            }
        }];
}
@end
