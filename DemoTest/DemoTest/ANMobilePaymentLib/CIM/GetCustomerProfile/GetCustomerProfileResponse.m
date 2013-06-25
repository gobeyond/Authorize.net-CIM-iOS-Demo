//
//  GetCustomerProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"
#import "PaymentProfileType.h"

@implementation GetCustomerProfileResponse
@synthesize merchantCustomerId;
@synthesize description;
@synthesize email;
@synthesize customerProfileId;
@synthesize paymentProfiles;
@synthesize shipToList;

+ (GetCustomerProfileResponse *) getCustomerProfileResponse {
	GetCustomerProfileResponse *m = [[[GetCustomerProfileResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.merchantCustomerId = nil;
        self.description = nil;
        self.email = nil;
        self.customerProfileId = nil;
        
        self.paymentProfiles = [NSMutableArray array];
        self.shipToList = [NSMutableArray array];
	}
	return self;
}

- (void) dealloc {
    self.merchantCustomerId = nil;
    self.description = nil;
    self.email = nil;
    self.customerProfileId = nil;
    self.paymentProfiles = nil;
    self.shipToList = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@"GetCustomerProfileResponse. "
						"merchantCustomerId = %@\n"
                        "description = %@\n"
                        "email = %@\n"
                        "customerProfileId = %@\n"
                        "paymentProfiles = %@\n"
                        "shipToList = %@\n",
						self.anetApiResponse,
                        self.merchantCustomerId,
                        self.description,
                        self.email,
                        [self.paymentProfiles description],
                        [self.shipToList description]];
	return output;
}

+ (GetCustomerProfileResponse *)parseGetCustomerProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	GetCustomerProfileResponse *g = [GetCustomerProfileResponse getCustomerProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.merchantCustomerId = [NSString stringValueOfXMLElement:doc.rootElement withName:@"merchantCustomerId"];
    g.description = [NSString stringValueOfXMLElement:doc.rootElement withName:@"description"];
    g.email = [NSString stringValueOfXMLElement:doc.rootElement withName:@"email"];
    g.customerProfileId = [NSString stringValueOfXMLElement:doc.rootElement withName:@"customerProfileId"];
    
	g.paymentProfiles = [self buildPaymentProfiles:doc.rootElement];
	g.shipToList = [self buildShipToList:doc.rootElement];
	
	NSLog(@"GetCustomerProfileResponse: %@", g);
	
    return g;
}

+ (NSMutableArray *)buildPaymentProfiles:(GDataXMLElement *)element {
	NSMutableArray *up = [NSMutableArray array];
	
	NSArray *currArray = [element elementsForName:@"paymentProfiles"];
	for (GDataXMLElement *node in currArray) {
		PaymentProfileType *p = [PaymentProfileType buildPaymentProfileType:node];
		[up addObject:p];
	}
	return up;
}

+ (NSMutableArray *)buildShipToList:(GDataXMLElement *)element {
	NSMutableArray *up = [NSMutableArray array];
	
	NSArray *currArray = [element elementsForName:@"shipToList"];
	for (GDataXMLElement *node in currArray) {
		CustomerAddressType *p = [CustomerAddressType buildCustomerAddressType:node];
		[up addObject:p];
	}
	return up;
}

// For unit testing.
+ (GetCustomerProfileResponse *)loadGetCustomerProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    GetCustomerProfileResponse *m = [self parseGetCustomerProfileResponse:xmlData];
	
	return m;
}
@end
