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
		
		if (created != nil) {
			NSTimeInterval interval = [created doubleValue];
			_created = [NSDate dateWithTimeIntervalSinceNow:interval];
		}
	}
	
	if (self.created != nil) {
		return self;
	}
	
	return nil;
}

@end
