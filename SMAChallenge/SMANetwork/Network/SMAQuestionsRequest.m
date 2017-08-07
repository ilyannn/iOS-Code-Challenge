//
//  SMAQuestionsRequest.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSArray+SMAFlatMap.h"
#import "SMAQuestion.h"
#import "SMAQuestionsRequest.h"

@implementation SMAQuestionsRequest

- (void)buildRequestComponents:(NSURLComponents *)components {
	[super buildRequestComponents:components];
	components.scheme = @"http";
	components.host = @"private-d847e-demoresponse.apiary-mock.com";
	components.path = @"/questions";
}

- (NSArray *)processJSONData:(NSArray *)array {
	return [array sma_flatMap:^id _Nullable(NSDictionary * _Nonnull maybe_dict) {
		if (![maybe_dict isKindOfClass:[NSDictionary class]]) {
			return nil;
		}
		return [SMAQuestion createFromAPIDictionary:maybe_dict];
	}];
}

@end
