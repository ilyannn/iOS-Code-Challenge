//
//  SMATextQuestion.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSDictionary+SMASafelyExtract.h"
#import "SMATextQuestion.h"

@implementation SMATextQuestion

- (instancetype)initWithAPIDictionary:(NSDictionary *)dict {
	
	if (self = [super initWithAPIDictionary:dict]) {
		_text = [dict sma_safelyExtract:[NSString class] fromKeypath:@"data.text"];
	}
	
	if (self.text != nil) {
		return self;
	}
	
	return nil;
}

- (NSString *)description {
	NSString *standard = [super description];
	return [NSString stringWithFormat:@"%@: `%@`", standard, self.text];
}

@end
