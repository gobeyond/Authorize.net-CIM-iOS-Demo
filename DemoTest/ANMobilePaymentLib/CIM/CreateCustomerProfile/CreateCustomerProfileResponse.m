//
//  CreateCustomerProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation CreateCustomerProfileResponse
@synthesize customerProfileId; 
@synthesize customerPaymentProfileIdList;

+ (CreateCustomerProfileResponse *) createCustomerProfileResponse {
	CreateCustomerProfileResponse *m = [[[CreateCustomerProfileResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.customerProfileId = nil;
        self.customerPaymentProfileIdList = [NSMutableArray array];
        self.customerShippingAddressIdList = [NSMutableArray array];
        self.validationDirectResponseList = [NSMutableArray array];
	}
	return self;
}

- (void) dealloc {
    self.customerProfileId = nil;
    self.customerPaymentProfileIdList = nil;
    self.customerShippingAddressIdList = nil;
    self.validationDirectResponseList = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerProfileResponse.anetApiResponse = %@\n"
                        "CreateCustomerProfileResponse.customerProfileId= %@\n",
						self.anetApiResponse,
                        self.customerProfileId];
	return output;
}

+ (CreateCustomerProfileResponse *)parseCreateCustomerProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	CreateCustomerProfileResponse *g = [CreateCustomerProfileResponse createCustomerProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.customerProfileId = [NSString stringValueOfXMLElement:doc.rootElement withName:@"customerProfileId"];
    
    NSArray *currArray = [doc.rootElement elementsForName:@"customerPaymentProfileIdList"];
	GDataXMLElement *currNode = (GDataXMLElement *) [currArray objectAtIndex:0];
	currArray = [currNode elementsForName:@"numericString"];
	for (GDataXMLElement *node in currArray) {
		[g.customerPaymentProfileIdList addObject:node.stringValue];
	}
    
    currArray = [doc.rootElement elementsForName:@"customerShippingAddressIdList"];
	currNode = (GDataXMLElement *) [currArray objectAtIndex:0];
	currArray = [currNode elementsForName:@"numericString"];
	for (GDataXMLElement *node in currArray) {
		[g.customerShippingAddressIdList addObject:node.stringValue];
	}
	
	NSLog(@"CreateCustomerProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (CreateCustomerProfileResponse *)loadCreateCustomerProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    CreateCustomerProfileResponse *m = [self parseCreateCustomerProfileResponse:xmlData];
	
	return m;
}
@end
