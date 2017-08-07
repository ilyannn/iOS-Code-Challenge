//
//  NSDictionary+SMASafelyExtract.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSDictionary+SMASafelyExtract.h"

@implementation NSDictionary (SMASafelyExtract)

- (id)sma_safelyExtract:(Class)type fromKeypath:(NSString *)keypath {
	
	id result = [self valueForKeyPath:keypath];
	
	if ([result isKindOfClass:type]) {
		return result;
	} else {
		return nil;
	}
}

@end
