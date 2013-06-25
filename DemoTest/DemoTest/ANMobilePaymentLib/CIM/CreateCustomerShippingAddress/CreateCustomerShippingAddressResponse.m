//
//  CreateCustomerShippingAddressResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerShippingAddressResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation CreateCustomerShippingAddressResponse
@synthesize customerAddressId; 

+ (CreateCustomerShippingAddressResponse *) createCustomerShippingAddressResponse {
	CreateCustomerShippingAddressResponse *m = [[[CreateCustomerShippingAddressResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerAddressId = nil;
	}
	return self;
}

- (void) dealloc {
    self.customerAddressId = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerShippingAddressResponse.anetApiResponse = %@\n"
                        "CreateCustomerShippingAddressResponse.customerAddressId = %@\n", 
						self.anetApiResponse,
                        self.customerAddressId];
	return output;
}

+ (CreateCustomerShippingAddressResponse *)parseCreateCustomerShippingAddressResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	CreateCustomerShippingAddressResponse *g = [CreateCustomerShippingAddressResponse createCustomerShippingAddressResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.customerAddressId = [NSString stringValueOfXMLElement:doc.rootElement withName:@"customerAddressId"];
	
	NSLog(@"CreateCustomerShippingAddressResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (CreateCustomerShippingAddressResponse *)loadCreateCustomerShippingAddressResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    CreateCustomerShippingAddressResponse *m = [self parseCreateCustomerShippingAddressResponse:xmlData];
	
	return m;
}
@end
