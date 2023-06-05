// ArticleModel.h

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

@property (nonatomic, strong) NSDictionary *source;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *articleDescription;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *urlToImage;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, strong) NSString *content;

@end
