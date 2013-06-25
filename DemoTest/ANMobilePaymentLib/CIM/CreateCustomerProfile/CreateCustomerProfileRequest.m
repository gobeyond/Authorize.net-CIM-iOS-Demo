//
//  CreateCustomerProfileRequest.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerProfileRequest.h"


@implementation CreateCustomerProfileRequest
@synthesize profile;

+ (CreateCustomerProfileRequest *) createCustomerProfileRequest {
	CreateCustomerProfileRequest *m = [[[CreateCustomerProfileRequest alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.profile = nil;
	}
	return self;
}

- (void) dealloc {
    self.profile = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerProfileRequest.anetApiRequest = %@\n"
                        "CreateCustomerProfileRequest.profile = %@\n",
						super.anetApiRequest,
                        (self.profile?[self.profile description]:@"")];
	return output;
}

- (NSString *) stringOfXMLRequest {
	NSString *s = [NSString stringWithFormat:@""
				   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
				   @"<createCustomerProfileRequest xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">"
						@"%@"
                        @"%@"  //profile
				   @"</createCustomerProfileRequest>",
				   [super.anetApiRequest stringOfXMLRequest],
                   [self.profile stringOfXMLRequest]];
	return s;
}

@end
