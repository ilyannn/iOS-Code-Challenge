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

- (void)buildRequestComponents:(NSURLComponents *)components {
	// redefine this in subclasses
}

@end
