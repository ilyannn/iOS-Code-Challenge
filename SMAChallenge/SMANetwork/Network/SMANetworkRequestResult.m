//
//  SMANetworkRequestResult.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMANetworkRequestResult.h"

NSString *SMANetworkRequestResultSerizalizationErrorDomain = @"SMANetworkRequestResultSerizalizationErrorDomain";

@implementation SMANetworkRequestResult

- (instancetype)initWithError:(NSError *)error {
	if (self = [super init]) {
		_error = error;
	}
	return self;
}

- (instancetype)initWithResult:(NSArray *)result {
	if (self = [super init]) {
		_result = result;
	}
	return self;
}

- (instancetype)initWithSerializationError {
	return [self initWithError:[NSError errorWithDomain:SMANetworkRequestResultSerizalizationErrorDomain code:1 userInfo:nil]];
}

- (NSString *)description {
	NSString *standard = [super description];
	
	if (self.error) {
		return [NSString stringWithFormat:@"%@ [ERROR: %@]", standard, self.error];
	} else {
		return [NSString stringWithFormat:@"%@ [RESULTS: %@]", standard, self.result];
	}
}

@end
