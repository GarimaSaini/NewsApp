//
//  NewsDetailsViewController.m
//  NewsApp
//
//  Created by Fineotech on 2023-06-02.
//

#import "NewsDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation NewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
}

-(void)initialSetup {
    self.titleLabel.text = _article.title;
    self.subtitleLabel.text = _article.articleDescription;
    NSString *imageUrl = self.article.urlToImage;
    NSURL *url= [NSURL URLWithString: imageUrl];
    UIImage *placeholderImage = [UIImage imageNamed: @"news"];
    [self.imageView sd_setImageWithURL: url placeholderImage: placeholderImage];
}

@end
