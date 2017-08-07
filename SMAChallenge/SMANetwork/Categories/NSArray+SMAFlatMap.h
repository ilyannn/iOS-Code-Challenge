//
//  NSArray+SMAFlatMap.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SMAFlatMap)
/// Applies function to elements of array; skips the nils; returns the resulting array.
- (NSArray *)sma_flatMap:(_Nullable id(^)(id))function;
@end

NS_ASSUME_NONNULL_END

