//
//  SMAChallengeTests.m
//  SMAChallengeTests
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SMANetwork/SMAModel.h>

@interface SMAChallengeTests : XCTestCase

@end

@implementation SMAChallengeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserModel {
	SMAUser *failure = [[SMAUser alloc] initWithAPIDictionary:@{ }];
	SMAUser *success = [[SMAUser alloc] initWithAPIDictionary:@{ @"name": @"John", @"country": @"USA" }];
	XCTAssertNil(failure);
	XCTAssertNotNil(success);
}

- (void)testQuestionModel {
	SMAUser *failure = [[SMAUser alloc] initWithAPIDictionary:@{ @"created": @0 }];
	SMAUser *success = [[SMAUser alloc] initWithAPIDictionary:@{ @"created": @(-449280), /* number of seconds passed since created */ @"type": @"IMG", @"data": @{ @"url": @"https://pixabay.com/xxxx" }, @"user" : @{ @"name": @"John", @"country": @"USA" } }];
	XCTAssertNil(failure);
	XCTAssertNotNil(success);
}

@end
