//
//  SMANetworkTests.m
//  SMAChallengeTests
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMANetwork/SMAQuestionsRequest.h>
#import <SMANetwork/SMANetworkManager.h>

@interface SMANetworkTests : XCTestCase
@property (nonatomic) SMAQuestionsRequest *request;
@end

@implementation SMANetworkTests

- (void)setUp {
    [super setUp];
	self.request = [SMAQuestionsRequest new];
}

- (void)testNetworkURL {
	NSURL *url = self.request.requestURL;
	NSURL *expected = [NSURL URLWithString:@"http://private-d847e-demoresponse.apiary-mock.com/questions"];
	XCTAssertEqualObjects(url, expected, @"The URL should match what is given.");
}


@end
