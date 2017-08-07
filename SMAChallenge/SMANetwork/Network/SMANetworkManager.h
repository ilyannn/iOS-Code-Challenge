//
//  SMANetworkManager.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <SMANetwork/SMANetworkRequest.h>
#import <SMANetwork/SMAQuestion.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMANetworkManager : NSObject
/// Performs request to /question, then executes the block with the result.
/// resultBlock is called on the main queue.
- (void)retrieveQuestionsAndThen:(void(^ _Nonnull)(SMANetworkRequestResult *))resultBlock;
@end

NS_ASSUME_NONNULL_END

