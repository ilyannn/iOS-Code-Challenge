//
//  SMANetworkRequestResult.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Wrapper that contains either an error or a result.
@interface SMANetworkRequestResult: NSObject

@property (readonly, nullable) NSError *error;
@property (readonly, nullable) NSArray *result;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithSerializationErrorUnderlyingError:(nullable NSError *)error;
- (instancetype)initWithError:(NSError *)error NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithResult:(NSArray *)result NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

