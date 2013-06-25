//
//  CreateCustomerProfileTransactionRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerProfileTransactionRequest.h"
#import "NSString+stringWithXMLTag.h"

@implementation CreateCustomerProfileTransactionRequest
@synthesize transaction;
@synthesize transactionType;

- (NSString *) getTransactionTypeString:(CUSTOMER_PROFILE_ACTION) action {
	switch (action) {
		case CP_AUTH_ONLY:
			return @"profileTransAuthOnly";
			break;
		case CP_AUTH_CAPTURE:
			return @"profileTransAuthCapture";
			break;
		case CP_PRIOR_AUTH_CAPTURE:
			return @"profileTransPriorAuthCapture";
			break;
		case CP_CAPTURE_ONLY:
			return @"profileTransCaptureOnly";
			break;
		case CP_VOID:
			return @"profileTransVoid";
			break;
		case CP_REFUND:
			return @"profileTransRefund";
			break;
		default:
			return @"";
			break;
	}
}

+ (CreateCustomerProfileTransactionRequest *) createCustomerProfileTransactionRequest {
	CreateCustomerProfileTransactionRequest *m = [[[CreateCustomerProfileTransactionRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.transaction = [CustomerProfileTransactionRequestType customerProfileTransactionRequestType];
        self.transactionType = CP_ACTION_UNKNOWN;
	}
	return self;
}

- (void) dealloc {
    self.transaction = nil;
    
	[super dealloc];
}

- (NSString *) description {
    self.transaction.transactionType = [self getTransactionTypeString:self.transactionType];
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerProfileTransactionRequest.anetApiRequest = %@\n"
                        "CreateCustomerProfileTransactionRequest.transaction = %@\n"
                        "CreateCustomerProfileTransactionRequest.transactionType = %@\n",
						super.anetApiRequest,
                        (self.transaction?[self.transaction description]:@""),
                        [self getTransactionTypeString:self.transactionType]];
	return output;
}

- (NSString *) stringOfXMLRequest {
    self.transaction.transactionType = [self getTransactionTypeString:self.transactionType];
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<createCustomerProfileTransactionRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"<transaction>%@</transaction>"   // paymentProfile
				   @"</createCustomerProfileTransactionRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [self.transaction stringOfXMLRequest]];
	return s;
}

@end
