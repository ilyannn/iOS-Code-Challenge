//
//  NSArray+SMAFlatMap.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSArray+SMAFlatMap.h"

@implementation NSArray (SMAFlatMap)

- (NSArray *)sma_flatMap:(id  _Nullable (^)(id _Nonnull))function {
	NSMutableArray *result = [NSMutableArray new];
	[self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		id value = function(obj);
		if (value != nil) {
			[result addObject:value];
		}
	}];
	return [result copy];
}
@end
