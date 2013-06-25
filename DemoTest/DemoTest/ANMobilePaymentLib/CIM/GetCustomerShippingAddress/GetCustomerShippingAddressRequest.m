//
//  GetCustomerShippingAddressRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerShippingAddressRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation GetCustomerShippingAddressRequest
@synthesize customerProfileId;
@synthesize customerAddressId;

+ (GetCustomerShippingAddressRequest *) getCustomerShippingAddressRequest {
	GetCustomerShippingAddressRequest *m = [[[GetCustomerShippingAddressRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.customerAddressId = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    self.customerAddressId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"GetCustomerShippingAddressRequest.anetApiRequest = %@\n"
                        "GetCustomerShippingAddressRequest.customerProfileId = %@\n"
                        "GetCustomerShippingAddressRequest.customerAddressId = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        self.customerAddressId];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<getCustomerShippingAddressRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"%@"  //customerAddressId
				   @"</getCustomerShippingAddressRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [NSString stringWithXMLTag:@"customerAddressId" andValue:self.customerAddressId]];
	return s;
}

@end
