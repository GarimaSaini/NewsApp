//
//  NewsListControllerViewModel.m
//  NewsApp
//
//  Created by Fineotech on 2023-06-03.
//

#import "NewsListControllerViewModel.h"
#import "NetworkManager.h"

@implementation NewsListControllerViewModel

#define NEWS_BASE_URL "https://newsapi.org/v2/top-headlines?country=us&apiKey="
#define NEWS_API_KEY "08e776fa5db24179823ebe4dce441782"

- (void)callAPI:(void (^)(NSMutableArray<ArticleModel *> * _Nullable json, NSError * _Nullable error))completionHandler {
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    NSString *urlString  = [NSString stringWithFormat:@"%s%s", NEWS_BASE_URL, NEWS_API_KEY];
    [networkManager callAPI:urlString res:^(NSDictionary * _Nullable jsonDict, NSError * _Nullable error) {
        NSArray *articlesArray = jsonDict[@"articles"];
        NSMutableArray<ArticleModel *> *articles = [[NSMutableArray alloc] init];
        for (NSDictionary *articleDict in articlesArray) {
            ArticleModel *article = [[ArticleModel alloc] init];
            article.title = articleDict[@"title"];
            article.articleDescription = articleDict[@"description"];
            article.urlToImage = articleDict[@"urlToImage"];
            article.publishedAt = articleDict[@"publishedAt"];
            [articles addObject: article];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(articles, error);
        });
    }];
}

-(NSString*) getDate: (NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date  = [dateFormatter dateFromString: dateString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *newDate = [dateFormatter stringFromDate:date];
    return  newDate;
}

@end
