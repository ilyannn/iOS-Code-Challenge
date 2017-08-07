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

- (BOOL)isEqual:(id)object {
	if (![object isKindOfClass:[SMAUser class]]) {
		return NO;
	}
	if ([object isMemberOfClass:[SMAUser class]]) {
		return [self.name isEqual:[object name]] && [self.country isEqual:[object country]];
	}
	return [object isEqual:self];
}

- (NSUInteger)hash {
	return [self.name hash] + [self.country hash];
}

- (NSString *)description {
	NSString *format = NSLocalizedString(@"%@ from %@", @"User description localized format");
	return [NSString stringWithFormat:format, self.name, self.country];
}

@end
