//
//  SMAQuestionsRequest.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMAQuestionsRequest.h"

@implementation SMAQuestionsRequest

- (void)buildRequestComponents:(NSURLComponents *)components {
	[super buildRequestComponents:components];
	components.scheme = @"http";
	components.host = @"private-d847e-demoresponse.apiary-mock.com";
	components.path = @"/questions";
}

@end
