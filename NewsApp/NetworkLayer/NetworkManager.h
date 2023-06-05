//
//  NetworkManager.h
//  NewsApp
//
//  Created by Fineotech on 2023-06-03.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
- (void)callAPI:(NSString*)url res:(void (^)(NSDictionary * _Nullable json, NSError * _Nullable error))completionHandler;
@end

NS_ASSUME_NONNULL_END
