//
//  SMANiceDateTests.m
//  SMAChallengeTests
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMANiceDateFormatter.h"

@interface SMANiceDateTests : XCTestCase
@property SMANiceDateFormatter *formatter;
@end

@implementation SMANiceDateTests

- (void)setUp {
    [super setUp];
	self.formatter = [SMANiceDateFormatter new];
}

- (void)testDates {
	NSArray *dates = @[[NSDate new], [NSDate dateWithTimeIntervalSinceNow:-3670], [NSDate dateWithTimeIntervalSinceNow:-3600 * 50]];
	NSArray *results = @[@"just now", @"1 hour ago", @"2 days ago"];
	[dates enumerateObjectsUsingBlock:^(NSDate *date, NSUInteger idx, BOOL * _Nonnull stop) {
		NSString *formatted = [self.formatter stringFromDate:date relativeToDate:dates[0]];
//		NSLog(@"%@ -> %@", date, formatted);
		XCTAssertEqualObjects(formatted,
							  results[idx],
							  @"This test assumes English localization and checks the date strings.");
	}];
}

@end
