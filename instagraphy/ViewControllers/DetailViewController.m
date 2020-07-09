//
//  DetailViewController.m
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/9/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.tappedPost.caption);
    self.captionLabel.text = self.tappedPost.caption;
    self.timeStampLabel.text = [NSString stringWithFormat:@"%@",self.tappedPost.createdAt];
    self.postImageView.file = self.tappedPost.image;
    [self.postImageView loadInBackground];
}



@end
