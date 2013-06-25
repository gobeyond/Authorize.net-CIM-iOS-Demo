//
//  ValidateCustomerPaymentProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "ValidateCustomerPaymentProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation ValidateCustomerPaymentProfileResponse

+ (ValidateCustomerPaymentProfileResponse *) validateCustomerPaymentProfileResponse {
	ValidateCustomerPaymentProfileResponse *m = [[[ValidateCustomerPaymentProfileResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
	}
	return self;
}

- (void) dealloc {
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"ValidateCustomerPaymentProfileResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (ValidateCustomerPaymentProfileResponse *)parseValidateCustomerPaymentProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	ValidateCustomerPaymentProfileResponse *g = [ValidateCustomerPaymentProfileResponse validateCustomerPaymentProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"ValidateCustomerPaymentProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (ValidateCustomerPaymentProfileResponse *)loadValidateCustomerPaymentProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    ValidateCustomerPaymentProfileResponse *m = [self parseValidateCustomerPaymentProfileResponse:xmlData];
	
	return m;
}
@end
