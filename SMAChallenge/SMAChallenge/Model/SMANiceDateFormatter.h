//
//  SMANiceDateFormatter.h
//  SMAChallenge
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Formats distance between dates as "3 days ago", "2 minutes ago", "just now".
@interface SMANiceDateFormatter : NSObject
- (NSString *)stringFromDate:(NSDate *)date relativeToDate:(NSDate *)now;
@end

NS_ASSUME_NONNULL_END
