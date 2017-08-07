//
//  SMAObject.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Base object, can be created from API data.
@interface SMAObject : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (nullable instancetype)initWithAPIDictionary:(NSDictionary *)dict NS_DESIGNATED_INITIALIZER ;
@end

NS_ASSUME_NONNULL_END

