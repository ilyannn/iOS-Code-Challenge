//
//  SMAImageQuestion.m
//  SMANetwork
//
//  Created by Ilya Nikokoshev on 7.08.17.
//  Copyright © 2017 Ilya Nikokoshev. All rights reserved.
//

#import "NSDictionary+SMASafelyExtract.h"
#import "SMAImageQuestion.h"

@implementation SMAImageQuestion

- (instancetype)initWithAPIDictionary:(NSDictionary *)dict {
	
	if (self = [super initWithAPIDictionary:dict]) {
		NSString *urlString = [dict sma_safelyExtract:[NSString class] fromKeypath:@"data.url"];
		_imageURL = [NSURL URLWithString:urlString];
	}
	
	if (self.imageURL != nil) {
		return self;
	}
	
	return nil;
}
@end
