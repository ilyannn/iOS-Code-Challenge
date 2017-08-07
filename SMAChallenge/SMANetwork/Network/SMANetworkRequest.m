//
//  SMANetworkRequest.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMANetworkRequest.h"


@implementation SMANetworkRequest

- (NSURL *)requestURL {
	
	NSURLComponents *components = [NSURLComponents new];
	[self buildRequestComponents:components];
	return [components URL];
}

- (id)processResults:(NSData *)data error:(NSError *)error {
	
	if (error != nil) {
		return [[SMANetworkRequestResult alloc] initWithError:error];
	}
	
	if (data != nil) {
		NSError *jsonError;
		
		id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		
		if (jsonError != nil) {
			return [[SMANetworkRequestResult alloc] initWithSerializationErrorUnderlyingError:jsonError];
		}
		
		if ([json isKindOfClass:[NSArray class]]) {
			return [[SMANetworkRequestResult alloc] initWithResult:[self processJSONData:json]];
		}
	}
	
	return [[SMANetworkRequestResult alloc] initWithSerializationErrorUnderlyingError:error];
}

- (void)buildRequestComponents:(NSURLComponents *)components {
	// redefine this in subclasses
}

- (NSArray *)processJSONData:(NSArray *)array {
	return @[];
}

@end
