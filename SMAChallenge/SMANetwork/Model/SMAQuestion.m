//
//  SMAQuestion.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSDictionary+SMASafelyExtract.h"
#import "SMAQuestion.h"
#import "SMATextQuestion.h"
#import "SMAImageQuestion.h"
#import "SMAUser.h"

@implementation SMAQuestion

+ (instancetype)createFromAPIDictionary:(NSDictionary *)dict {
	
	NSString *type = [dict sma_safelyExtract:[NSString class] fromKeypath:@"type"];
	
	if ([type isEqualToString:@"TEXT"]) {
		return [[SMATextQuestion alloc] initWithAPIDictionary:dict];
	}
	
	if ([type isEqualToString:@"IMG"]) {
		return [[SMAImageQuestion alloc] initWithAPIDictionary:dict];
	}
	
	return nil;
}

- (instancetype)initWithAPIDictionary:(NSDictionary *)dict {
	
	if (self = [super initWithAPIDictionary:dict]) {
		
		NSNumber *created = [dict sma_safelyExtract:[NSNumber class] fromKeypath:@"created"];
		NSDictionary *userDict = [dict sma_safelyExtract:[NSDictionary class] fromKeypath:@"user"];
		
		if (created != nil) {
			NSTimeInterval interval = [created doubleValue];
			if (interval < 0) {
				_created = [NSDate dateWithTimeIntervalSinceNow:interval];
			}
		}
		
		if (userDict != nil) {
			_user = [[SMAUser alloc] initWithAPIDictionary:userDict];
		}
	}
	
	if (self.created != nil && self.user != nil) {
		return self;
	}
	
	return nil;
}

@end
