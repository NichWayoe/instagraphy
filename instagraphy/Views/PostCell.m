//
//  PostCell.m
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/8/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
@import Parse;

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setPost:(Post *)post{
    _post = post;
    self.postImageView.file = post.image;
    [self.postImageView loadInBackground];
    self.captionLabel.text = post.caption;
}
@end
