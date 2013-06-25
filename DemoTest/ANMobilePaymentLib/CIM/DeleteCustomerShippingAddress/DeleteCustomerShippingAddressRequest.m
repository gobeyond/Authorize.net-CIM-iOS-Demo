//
//  DeleteCustomerShippingAddressRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "DeleteCustomerShippingAddressRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation DeleteCustomerShippingAddressRequest
@synthesize customerProfileId;
@synthesize customerAddressId;

+ (DeleteCustomerShippingAddressRequest *) deleteCustomerShippingAddressRequest {
	DeleteCustomerShippingAddressRequest *m = [[[DeleteCustomerShippingAddressRequest alloc] init] autorelease];
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
						"DeleteCustomerShippingAddressRequest.anetApiRequest = %@\n"
                        "DeleteCustomerShippingAddressRequest.customerProfileId = %@\n"
                        "DeleteCustomerShippingAddressRequest.customerAddressId = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        self.customerAddressId];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<deleteCustomerShippingAddressRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"%@"  //customerAddressId
				   @"</deleteCustomerShippingAddressRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [NSString stringWithXMLTag:@"customerAddressId" andValue:self.customerAddressId]];
	return s;
}

@end
