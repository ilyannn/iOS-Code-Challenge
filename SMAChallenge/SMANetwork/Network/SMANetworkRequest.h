//
//  SMANetworkRequest.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// A generic request. Abstract class.
@interface SMANetworkRequest : NSObject

@property (readonly, atomic) NSURL *requestURL;

// Define this in subclasses.
- (void)buildRequestComponents:(NSURLComponents *)components;

@end

NS_ASSUME_NONNULL_END

