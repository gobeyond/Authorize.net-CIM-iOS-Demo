//
//  UpdateCustomerShippingAddressResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "UpdateCustomerShippingAddressResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation UpdateCustomerShippingAddressResponse

+ (UpdateCustomerShippingAddressResponse *) updateCustomerShippingAddressResponse {
	UpdateCustomerShippingAddressResponse *m = [[[UpdateCustomerShippingAddressResponse alloc] init] autorelease];
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
						"UpdateCustomerShippingAddressResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (UpdateCustomerShippingAddressResponse *)parseUpdateCustomerShippingAddressResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	UpdateCustomerShippingAddressResponse *g = [UpdateCustomerShippingAddressResponse updateCustomerShippingAddressResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"UpdateCustomerShippingAddressResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (UpdateCustomerShippingAddressResponse *)loadUpdateCustomerShippingAddressResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    UpdateCustomerShippingAddressResponse *m = [self parseUpdateCustomerShippingAddressResponse:xmlData];
	
	return m;
}
@end
