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
	
	SMAQuestion *failure = [[SMAQuestion alloc] initWithAPIDictionary:@{ @"created": @0 }];
	
	SMAQuestion *imageQuestion = [SMAQuestion createFromAPIDictionary:@{ @"created": @(-449280), /* number of seconds passed since created */ @"type": @"IMG", @"data": @{ @"url": @"https://pixabay.com/xxxx" }, @"user" : @{ @"name": @"John", @"country": @"USA" } }];
	
	SMAQuestion *textQuestion = [SMAQuestion createFromAPIDictionary:@{ @"created": @(-280800), /* number of seconds passed since created */ @"type": @"TEXT", @"data": @{ @"text": @"The real danger is not that computers will begin to think like men, but that men will begin to think like computers." }, @"user": @{ @"name": @"Sydney Harris", @"country": @"USA" } }];
	
	XCTAssertNil(failure, @"This dictionary should not correspond to an object");
	
	XCTAssert([imageQuestion isKindOfClass:[SMAImageQuestion class]], @"This should deserialize as image");
	XCTAssert([textQuestion isKindOfClass:[SMATextQuestion class]], @"This should deserialize as text");
	
	XCTAssertEqualObjects(imageQuestion.user.name, @"John");
	XCTAssertEqualObjects(textQuestion.user.country, @"USA");
	XCTAssert([textQuestion.created compare:imageQuestion.created] == NSOrderedDescending, @"The first date should be earlier");
}

@end
