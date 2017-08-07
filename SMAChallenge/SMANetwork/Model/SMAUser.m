//
//  SMAUser.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSDictionary+SMASafelyExtract.h"
#import "SMAUser.h"

@implementation SMAUser

- (instancetype)initWithAPIDictionary:(NSDictionary *)dict {
	
	if (self = [super initWithAPIDictionary:dict]) {
		_name = [dict sma_safelyExtract:[NSString class] fromKeypath:@"name"];
		_country = [dict sma_safelyExtract:[NSString class] fromKeypath:@"country"];
	}
	
	if (self.name != nil && self.country != nil) {
		return self;
	}
	
	return nil;
}

@end
