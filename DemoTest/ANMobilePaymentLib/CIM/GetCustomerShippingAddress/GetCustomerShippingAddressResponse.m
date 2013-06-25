//
//  GetCustomerShippingAddressResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerShippingAddressResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation GetCustomerShippingAddressResponse
@synthesize address;

+ (GetCustomerShippingAddressResponse *) getCustomerShippingAddressResponse {
	GetCustomerShippingAddressResponse *m = [[[GetCustomerShippingAddressResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.address = nil;
	}
	return self;
}

- (void) dealloc {
    self.address = nil;
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@"GetCustomerShippingAddressResponse = "
						"anetApiResponse = %@\n"
                        "customerAddressType = %@\n",
						self.anetApiResponse,
                        (self.address?[self.address description]:@"")];
	return output;
}

+ (GetCustomerShippingAddressResponse *)parseGetCustomerShippingAddressResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	GetCustomerShippingAddressResponse *g = [GetCustomerShippingAddressResponse getCustomerShippingAddressResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    
    NSArray *currArray = [doc.rootElement elementsForName:@"address"];
	GDataXMLElement *childNode = [currArray objectAtIndex:0];
    g.address = [CustomerAddressType buildCustomerAddressType:childNode];
	
	NSLog(@"GetCustomerShippingAddressResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (GetCustomerShippingAddressResponse *)loadGetCustomerShippingAddressResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    GetCustomerShippingAddressResponse *m = [self parseGetCustomerShippingAddressResponse:xmlData];
	
	return m;
}
@end
