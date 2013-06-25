//
//  CreateCustomerPaymentProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerPaymentProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation CreateCustomerPaymentProfileResponse
@synthesize customerPaymentProfileId; 
@synthesize validationDirectResponse;

+ (CreateCustomerPaymentProfileResponse *) createCustomerPaymentProfileResponse {
	CreateCustomerPaymentProfileResponse *m = [[[CreateCustomerPaymentProfileResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerPaymentProfileId = nil;
        self.validationDirectResponse = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerPaymentProfileId = nil;
    self.validationDirectResponse = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerPaymentProfileResponse.anetApiResponse = %@\n"
                        "CreateCustomerPaymentProfileResponse.customerPaymentProfileId = %@\n"
                        "CreateCustomerPaymentProfileResponse.validationDirectResponse = %@\n",
						self.anetApiResponse,
                        self.customerPaymentProfileId,
                        self.validationDirectResponse];
	return output;
}

+ (CreateCustomerPaymentProfileResponse *)parseCreateCustomerPaymentProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	CreateCustomerPaymentProfileResponse *g = [CreateCustomerPaymentProfileResponse createCustomerPaymentProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.customerPaymentProfileId = [NSString stringValueOfXMLElement:doc.rootElement withName:@"customerPaymentProfileId"];
    g.validationDirectResponse = [NSString stringValueOfXMLElement:doc.rootElement withName:@"validationDirectResponse"];
	
	NSLog(@"CreateCustomerPaymentProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (CreateCustomerPaymentProfileResponse *)loadCreateCustomerPaymentProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    CreateCustomerPaymentProfileResponse *m = [self parseCreateCustomerPaymentProfileResponse:xmlData];
	
	return m;
}
@end
