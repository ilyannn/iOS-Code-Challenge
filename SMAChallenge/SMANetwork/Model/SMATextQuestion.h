//
//  SMATextQuestion.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMAQuestion.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMATextQuestion : SMAQuestion
@property (nonatomic, copy) NSString *text;
@end

NS_ASSUME_NONNULL_END

