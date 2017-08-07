//
//  SMAUser.h
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "SMAObject.h"

/// User object with two fields
@interface SMAUser : SMAObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *country;

@end
