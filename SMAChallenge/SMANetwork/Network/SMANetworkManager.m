//
//  SMANetworkManager.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMANetworkManager.h"
#import "SMAQuestionsRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMANetworkManager() <NSURLSessionTaskDelegate>
@property NSOperationQueue *operations;
@property NSURLSession *session;
@end

NS_ASSUME_NONNULL_END

@implementation SMANetworkManager

- (instancetype)init {
	if (self = [super init]) {
		NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
		_session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
	}
	return self;
}

- (void)startRequest:(SMANetworkRequest *)request withResultBlock:(void(^)(SMANetworkRequestResult *))resultBlock {
	[self.session dataTaskWithURL:request.requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		SMANetworkRequestResult *result = [request processResults:data error:error];
		dispatch_async(dispatch_get_main_queue(), ^{
			resultBlock(result);
		});
	}];
}

- (void)retrieveQuestionsAndThen:(void (^)(SMANetworkRequestResult * _Nonnull))resultBlock {
	[self startRequest:[SMAQuestionsRequest new] withResultBlock:resultBlock];
}
		 
		 
@end
