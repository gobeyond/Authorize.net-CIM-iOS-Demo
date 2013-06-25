//
//  CreateCustomerShippingAddressRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerShippingAddressRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation CreateCustomerShippingAddressRequest
@synthesize customerProfileId;
@synthesize address;

+ (CreateCustomerShippingAddressRequest *) createCustomerShippingAddressRequest {
	CreateCustomerShippingAddressRequest *m = [[[CreateCustomerShippingAddressRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.address = [CustomerAddressType customerAddressType];
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
						"CreateCustomerShippingAddressRequest.anetApiRequest = %@\n"
                        "CreateCustomerShippingAddressRequest.customerProfileId = %@\n"
                        "CreateCustomerShippingAddressRequest.address = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        (self.address?[self.address description]:@"")];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<createCustomerShippingAddressRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"
                        @"<address>%@</address>"
				   @"</createCustomerShippingAddressRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [self.address stringOfXMLRequest]];
	return s;
}

@end
