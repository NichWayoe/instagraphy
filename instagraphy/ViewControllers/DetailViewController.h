//
//  DetailViewController.h
//  instagraphy
//
//  Created by Nicholas Wayoe on 7/9/20.
//  Copyright © 2020 Nicholas Wayoe. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "Parse/Parse.h"
@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : ViewController

@property (strong,nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
