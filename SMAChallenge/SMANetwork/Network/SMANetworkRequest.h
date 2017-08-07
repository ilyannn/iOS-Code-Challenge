//
//  SMANetworkRequest.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SMANetwork/SMANetworkRequestResult.h>
NS_ASSUME_NONNULL_BEGIN

/// A generic request that knows where to go and how to process the result. Abstract class.
@interface SMANetworkRequest : NSObject

@property (readonly, atomic) NSURL *requestURL;

// Defers to processJSONData by default.
- (SMANetworkRequestResult *)processResults:(nullable NSData *)data error:(nullable NSError *)error;

// Define this in subclasses.
- (void)buildRequestComponents:(NSURLComponents *)components;
- (NSArray *)processJSONData:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END

