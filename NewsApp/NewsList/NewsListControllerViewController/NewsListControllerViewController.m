//
//  NewsListControllerViewController.m
//  NewsApp
//
//  Created by Fineotech on 2023-06-01.
//

#import "NewsListControllerViewController.h"
#import "NewsListTableViewCell.h"
#import "ArticleModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NewsDetailsViewController.h"
#import "NetworkManager.h"
#import "NewsListControllerViewModel.h"

@interface NewsListControllerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray<ArticleModel *> *articles;
@property (nonatomic, strong) NewsListControllerViewModel * viewModel;

@end

@implementation NewsListControllerViewController

#pragma mark: ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intialSetup];
}

-(void)intialSetup {
    _viewModel = [[NewsListControllerViewModel alloc] init];
    self.title = @"News";
    [self getNewsList];
}

#pragma mark: Methods

-(void)getNewsList {
    [_viewModel callAPI:^(NSMutableArray<ArticleModel *> * _Nullable json, NSError * _Nullable error) {
        if (error == nil) {
            self.articles = [[NSMutableArray alloc] init];
            self.articles = json;
            [self.tableView reloadData];
        } else {
            NSLog(@"Something went wrong");
        }
    }];
}

#pragma mark: Tableview DataSource & Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"NewsListTableViewCell";
    NewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.titleLabel.text = self.articles[indexPath.row].title;
    if (![self.articles[indexPath.row].articleDescription isEqual: [NSNull null]]) {
        cell.subtitleLabel.text = self.articles[indexPath.row].articleDescription;
    }
    NSString *dateString = self.articles[indexPath.row].publishedAt;
    cell.dateLabel.text = [_viewModel getDate: dateString];
    NSString *imageUrl = self.articles[indexPath.row].urlToImage;
    if (![imageUrl isEqual: [NSNull null]]) {
        [cell.imageView sd_setImageWithURL: [NSURL URLWithString: imageUrl] placeholderImage: [UIImage imageNamed: @"news"]];
    }
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsDetailsViewController *newsDetailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailsViewController"];
    newsDetailsController.article = self.articles[indexPath.row];
    [self.navigationController pushViewController:newsDetailsController animated:YES];
}

@end
