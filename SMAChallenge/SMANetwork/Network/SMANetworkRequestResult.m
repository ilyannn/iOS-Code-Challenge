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

- (instancetype)initWithSerializationErrorUnderlyingError:(NSError *)error {
	
	NSString *techErrorString = @"Incorrect JSON given to parsing";
	NSString *userErrorString = @"Incorrect data returned from the server";
	NSMutableDictionary *errorDictionary = [@{NSLocalizedDescriptionKey: NSLocalizedString(userErrorString, @"User-visible serialization error description"),
											 NSDebugDescriptionErrorKey: techErrorString
											 } mutableCopy];
	errorDictionary[NSUnderlyingErrorKey] = error;
	
	return [self initWithError:[NSError errorWithDomain:SMANetworkRequestResultSerizalizationErrorDomain code:1 userInfo:errorDictionary]];
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
