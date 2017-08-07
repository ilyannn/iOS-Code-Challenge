//
//  SMANiceDateFormatter.m
//  SMAChallenge
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMANiceDateFormatter.h"

#define MAX_DAYS_AGO 10
#define MIN_SECONDS_AGO 10

NS_ASSUME_NONNULL_BEGIN

@interface SMANiceDateFormatter ()
@property (readonly) NSDateFormatter *regularDateFormatter;
@property (readonly) NSDateComponentsFormatter *unitsFormatter;
@end
		   
NS_ASSUME_NONNULL_END
		   
@implementation SMANiceDateFormatter

- (instancetype)init {
	if (self = [super init]) {
		_regularDateFormatter = [NSDateFormatter new];
		_regularDateFormatter.dateStyle = NSDateFormatterShortStyle;
		_unitsFormatter = [NSDateComponentsFormatter new];
		_unitsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
		_unitsFormatter.allowedUnits = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
		_unitsFormatter.maximumUnitCount = 1;
	}
	return self;
}

- (NSString *)stringFromDate:(NSDate *)date relativeToDate:(NSDate *)now {
	
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *ago = [calendar components:NSCalendarUnitDay fromDate:date toDate:now options:0];
	
	if (ago.day > MAX_DAYS_AGO) {
		return [self.regularDateFormatter stringFromDate:date];
	}
	
	if ([now timeIntervalSinceDate:date] < MIN_SECONDS_AGO) {
		return NSLocalizedString(@"just now", @"Date that is very recent");
	}
	
	NSString *format = NSLocalizedString(@"%@ ago", @"Template for date in the past");
	
	return [NSString stringWithFormat:format, [self.unitsFormatter stringFromDate:date toDate:now]];
}
@end
