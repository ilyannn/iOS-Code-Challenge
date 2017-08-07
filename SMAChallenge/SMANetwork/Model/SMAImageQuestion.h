//
//  SMAImageQuestion.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMAQuestion.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMAImageQuestion : SMAQuestion
@property (nonatomic, readonly) NSURL *imageURL;
@end

NS_ASSUME_NONNULL_END
