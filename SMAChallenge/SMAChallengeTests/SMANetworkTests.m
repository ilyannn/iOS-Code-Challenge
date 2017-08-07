//
//  SMANetworkTests.m
//  SMAChallengeTests
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <SMANetwork/SMANetwork.h>

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

- (void)testDeserializationError {
	
	SMANetworkRequestResult *results = [self.request processResults:[NSData new] error:nil];
	
	XCTAssertNil(results.result, @"Nothing to deserialize");
	XCTAssertNotNil(results.error, @"Error should be present");
	
	NSLog(@"Bad result should look like this: %@", results);
}

- (void)testQuestionsParsing {
	NSURL *testFile = [[NSBundle bundleForClass:[self class]] URLForResource:@"questionsTest" withExtension:@"json"];
	NSData *data = [NSData dataWithContentsOfURL:testFile];
	
	SMANetworkRequestResult *results = [self.request processResults:data error:nil];
	NSArray *questions = results.result;
	XCTAssert([questions count] == 2, @"All other objects should not deserialize");
	XCTAssert([[questions firstObject] isKindOfClass:[SMAImageQuestion class]]);
	XCTAssert([[questions lastObject] isKindOfClass:[SMATextQuestion class]]);
	SMAImageQuestion *imageQuestion = [questions firstObject];
	XCTAssertEqualObjects(imageQuestion.user.name, @"John", @"The name should be parsed.");
	
	NSLog(@"Good result should look like this: %@", results);
}

- (void)testSyncronousURLRetrieval {
	
	NSData *data = [NSData dataWithContentsOfURL:self.request.requestURL];
	SMANetworkRequestResult *results = [self.request processResults:data error:nil];
	NSArray *questions = results.result;
	XCTAssert(questions.count > 0, @"This test assumes that endpoint works and blocks on it. There should be some questions correctly parsed.");
}

- (void)testAsyncronousURLRetrieval {
	
	XCTestExpectation *expectation = [self expectationWithDescription: @"This test assumes that endpoint works. It should retrieve and parse questions."];
	
	SMANetworkManager *manager = [SMANetworkManager new];
	[manager retrieveQuestionsAndThen:^(SMANetworkRequestResult * _Nonnull results) {
		NSArray *questions = results.result;
		XCTAssert(questions.count > 0);
		[expectation fulfill];
		NSLog(@"Questions coming from the endpoint are: %@", questions);
	}];
	
	[self waitForExpectationsWithTimeout:10.0 handler:nil];
}

@end
