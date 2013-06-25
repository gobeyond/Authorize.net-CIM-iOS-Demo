//
//  CreateCustomerPaymentProfileRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerPaymentProfileRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation CreateCustomerPaymentProfileRequest
@synthesize customerProfileId;
@synthesize paymentProfile;
@synthesize payment;
@synthesize validationMode; 

+ (CreateCustomerPaymentProfileRequest *) createCustomerPaymentProfileRequest {
	CreateCustomerPaymentProfileRequest *m = [[[CreateCustomerPaymentProfileRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.paymentProfile = nil;
        self.payment = nil;
        self.validationMode = NONE_MODE;
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
                        "CreateCustomerPaymentProfileRequest.anetApiRequest = %@\n"
                        "CreateCustomerPaymentProfileRequest.customerProfileId = %@\n"
                        "CreateCustomerPaymentProfileRequest.paymentProfile = %@\n"
                        "CreateCustomerPaymentProfileRequest.payment = %@\n"
						"CreateCustomerPaymentProfileRequest.validationMode = %@\n",
						super.anetApiRequest,
                        self.customerProfileId,
                        (self.paymentProfile?[self.paymentProfile description]:@"") ,
                        (self.payment?[self.payment description]:@""),
                        [ValidationModes getValidationMode:self.validationMode]];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<createCustomerPaymentProfileRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //customerProfileId
                        @"%@"  // paymentProfile
                        @"%@"  // payment
                        @"%@"  // validationMode
				   @"</createCustomerPaymentProfileRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   ((self.paymentProfile)?[self.paymentProfile stringOfXMLRequest]:@""),
                   ((self.payment)?[self.payment stringOfXMLRequest]:@""),
                   [NSString stringWithXMLTag:@"validationMode" andValue:[ValidationModes getValidationMode:self.validationMode]]];
	return s;
}

@end
