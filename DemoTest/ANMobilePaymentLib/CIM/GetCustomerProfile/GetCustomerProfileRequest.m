//
//  GetCustomerProfileRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerProfileRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation GetCustomerProfileRequest
@synthesize customerProfileId;

+ (GetCustomerProfileRequest *) getCustomerProfileRequest {
	GetCustomerProfileRequest *m = [[[GetCustomerProfileRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	
	NSString *output = [NSString stringWithFormat:@""
						"GetCustomerProfileRequest.anetApiRequest = %@\n"
                        "GetCustomerProfileRequest.customerProfileId = %@\n",
						super.anetApiRequest,
                        self.customerProfileId];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<getCustomerProfileRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
				   @"</getCustomerProfileRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId]];
	return s;
}

@end
