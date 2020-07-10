//
//  DetailViewController.m
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/9/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "DetailViewController.h"
#import "DateTools.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.post.caption);
    self.captionLabel.text = self.post.caption;
    self.timeStampLabel.text = [NSString stringWithFormat:@"%@",self.post.createdAt.shortTimeAgoSinceNow];
    self.postImageView.file = self.post.image;
    [self.postImageView loadInBackground];
}



@end
