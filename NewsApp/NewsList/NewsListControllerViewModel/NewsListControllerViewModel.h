//
//  NewsListControllerViewModel.h
//  NewsApp
//
//  Created by Fineotech on 2023-06-03.
//

#import <Foundation/Foundation.h>
#import "ArticleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsListControllerViewModel : NSObject
- (void)callAPI:(void (^)(NSMutableArray<ArticleModel *> * _Nullable json, NSError * _Nullable error))completionHandler;
-(NSString*) getDate: (NSString *)dateString;
@end

NS_ASSUME_NONNULL_END
