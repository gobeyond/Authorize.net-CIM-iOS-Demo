//
//  DeleteCustomerShippingAddressResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "DeleteCustomerShippingAddressResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation DeleteCustomerShippingAddressResponse

+ (DeleteCustomerShippingAddressResponse *) deleteCustomerShippingAddressResponse {
	DeleteCustomerShippingAddressResponse *m = [[[DeleteCustomerShippingAddressResponse alloc] init] autorelease];
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
						"DeleteCustomerShippingAddressResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (DeleteCustomerShippingAddressResponse *)parseDeleteCustomerShippingAddressResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	DeleteCustomerShippingAddressResponse *g = [DeleteCustomerShippingAddressResponse deleteCustomerShippingAddressResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"DeleteCustomerShippingAddressResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (DeleteCustomerShippingAddressResponse *)loadDeleteCustomerShippingAddressResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    DeleteCustomerShippingAddressResponse *m = [self parseDeleteCustomerShippingAddressResponse:xmlData];
	
	return m;
}
@end
