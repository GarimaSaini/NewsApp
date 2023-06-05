//
//  NewsDetailsViewController.h
//  NewsApp
//
//  Created by Fineotech on 2023-06-02.
//

#import <UIKit/UIKit.h>
#import "ArticleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailsViewController : UIViewController

@property (nonatomic, retain) ArticleModel *article;

@end

NS_ASSUME_NONNULL_END
