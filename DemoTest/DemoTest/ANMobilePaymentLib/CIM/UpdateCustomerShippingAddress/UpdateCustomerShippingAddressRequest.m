//
//  UpdateCustomerShippingAddressRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "UpdateCustomerShippingAddressRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation UpdateCustomerShippingAddressRequest
@synthesize customerProfileId;
@synthesize address;

+ (UpdateCustomerShippingAddressRequest *) updateCustomerShippingAddressRequest {
	UpdateCustomerShippingAddressRequest *u = [[[UpdateCustomerShippingAddressRequest alloc] init] autorelease];
	return u;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.address = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    self.address = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"UpdateCustomerShippingAddressRequest.anetApiRequest = %@\n"
                        "UpdateCustomerShippingAddressRequest.customerProfileId = %@\n"
                        "UpdateCustomerShippingAddressRequest.address = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        (self.address?[self.address description]:@"")];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<updateCustomerShippingAddressRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"<address>%@</address>"  //address
				   @"</updateCustomerShippingAddressRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [self.address stringOfXMLRequest]];
	return s;
}

@end
