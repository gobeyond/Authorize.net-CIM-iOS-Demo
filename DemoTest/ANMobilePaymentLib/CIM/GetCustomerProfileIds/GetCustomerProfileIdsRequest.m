//
//  GetCustomerProfileIdsRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerProfileIdsRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation GetCustomerProfileIdsRequest

+ (GetCustomerProfileIdsRequest *) getCustomerProfileIdsRequest {
	GetCustomerProfileIdsRequest *m = [[[GetCustomerProfileIdsRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
	}
	return self;
}

- (void) dealloc {
    
	[super dealloc];
}

- (NSString *) description {
	
	NSString *output = [NSString stringWithFormat:@""
						"GetCustomerProfileIdsRequest.anetApiRequest = %@\n",
						super.anetApiRequest];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<getCustomerProfileIdsRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
				   @"</getCustomerProfileIdsRequest>",
				   [super.anetApiRequest stringOfXMLRequest]];
	return s;
}

@end
