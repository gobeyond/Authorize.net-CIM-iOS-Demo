//
//  DeleteCustomerPaymentProfileRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "DeleteCustomerPaymentProfileRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation DeleteCustomerPaymentProfileRequest
@synthesize customerProfileId;
@synthesize customerPaymentProfileId;

+ (DeleteCustomerPaymentProfileRequest *) deleteCustomerPaymentProfileRequest {
	DeleteCustomerPaymentProfileRequest *m = [[[DeleteCustomerPaymentProfileRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.customerPaymentProfileId = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    self.customerPaymentProfileId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"DeleteCustomerPaymentProfileRequest.anetApiRequest = %@\n"
                        "DeleteCustomerPaymentProfileRequest.customerProfileId = %@\n"
                        "DeleteCustomerPaymentProfileRequest.customerPaymentProfileId = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        self.customerPaymentProfileId];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<deleteCustomerPaymentProfileRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"%@"  //customerPaymentProfileId
				   @"</deleteCustomerPaymentProfileRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [NSString stringWithXMLTag:@"customerPaymentProfileId" andValue:self.customerPaymentProfileId]];
	return s;
}

@end
