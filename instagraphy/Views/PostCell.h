//
//  PostCell.h
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/8/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"

@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property(nonatomic,strong)Post *post;
@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end
 


NS_ASSUME_NONNULL_END
