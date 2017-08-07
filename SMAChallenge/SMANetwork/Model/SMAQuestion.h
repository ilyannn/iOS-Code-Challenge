//
//  SMAQuestion.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMAObject.h"

@class SMAUser;

NS_ASSUME_NONNULL_BEGIN

/// Question object, can hold text or image.
@interface SMAQuestion : SMAObject

/// Returns an instance of SMATextQuestion or SMAImageQuestion (or nil).
+ (nullable instancetype)createFromAPIDictionary:(NSDictionary *)dict;

@property (nonatomic, readonly) SMAUser *user;
@property (nonatomic, readonly) NSDate *created;

@end

NS_ASSUME_NONNULL_END

