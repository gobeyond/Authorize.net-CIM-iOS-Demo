//
//  ValidateCustomerPaymentProfileRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "ValidateCustomerPaymentProfileRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation ValidateCustomerPaymentProfileRequest
@synthesize customerProfileId;
@synthesize customerAddressId;
@synthesize customerShippingAddressId;
@synthesize validationMode;

+ (ValidateCustomerPaymentProfileRequest *) validateCustomerPaymentProfileRequest {
	ValidateCustomerPaymentProfileRequest *u = [[[ValidateCustomerPaymentProfileRequest alloc] init] autorelease];
	return u;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.customerAddressId = nil;
        self.customerShippingAddressId = nil;
        self.validationMode = NONE_MODE;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    self.customerAddressId = nil;
    self.customerShippingAddressId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"ValidateCustomerPaymentProfileRequest.anetApiRequest = %@\n"
                        "ValidateCustomerPaymentProfileRequest.customerProfileId = %@\n"
                        "ValidateCustomerPaymentProfileRequest.customerAddressId = %@\n"
                        "ValidateCustomerPaymentProfileRequest.customerShippingAddressId = %@\n"
                        "ValidateCustomerPaymentProfileRequest.validationMode = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        self.customerAddressId,
                        self.customerShippingAddressId,
                        [ValidationModes getValidationMode:self.validationMode]];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<validateCustomerPaymentProfileRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"%@"  //customerAddressId
                        @"%@"  //customerShippingAddressId
                        @"%@"  //validationMode
				   @"</validateCustomerPaymentProfileRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [NSString stringWithXMLTag:@"customerAddressId" andValue:self.customerAddressId],
                   [NSString stringWithXMLTag:@"customerShippingAddressId" andValue:self.customerShippingAddressId],
                   [NSString stringWithXMLTag:@"validationMode" andValue:[ValidationModes getValidationMode:self.validationMode]]];
	return s;
}

@end
