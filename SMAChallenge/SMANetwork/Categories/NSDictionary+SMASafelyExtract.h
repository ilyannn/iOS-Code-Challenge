//
//  NSDictionary+SMASafelyExtract.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SMASafelyExtract)
/// Returns value only if it has the correct class.
- (nullable id)sma_safelyExtract:(Class)type fromKeypath:(NSString *)keypath;
@end

NS_ASSUME_NONNULL_END

