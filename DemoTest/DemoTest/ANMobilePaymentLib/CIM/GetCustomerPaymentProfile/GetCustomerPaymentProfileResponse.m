//
//  GetCustomerPaymentProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerPaymentProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation GetCustomerPaymentProfileResponse

@synthesize paymentProfileType;

+ (GetCustomerPaymentProfileResponse *) getCustomerPaymentProfileResponse {
	GetCustomerPaymentProfileResponse *m = [[[GetCustomerPaymentProfileResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.paymentProfileType = nil;
	}
	return self;
}

- (void) dealloc {
    self.paymentProfileType = nil;
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@"GetCustomerPaymentProfileResponse. "
						"anetApiResponse = %@\n"
                        "PaymentProfileType = %@\n",
						self.anetApiResponse,
                        (self.paymentProfileType?[self.paymentProfileType description]:@"")];
	return output;
}

+ (GetCustomerPaymentProfileResponse *)parseGetCustomerPaymentProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	GetCustomerPaymentProfileResponse *g = [GetCustomerPaymentProfileResponse getCustomerPaymentProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.paymentProfileType = [self buildPaymentProfile:doc.rootElement];
	
	NSLog(@"GetCustomerPaymentProfileResponse: %@", g);
	
    return g;
}

+ (PaymentProfileType *)buildPaymentProfile:(GDataXMLElement *)element {
	NSArray *currArray = [element elementsForName:@"merchantContact"];
	GDataXMLElement *currNode = (GDataXMLElement *) [currArray objectAtIndex:0];
	PaymentProfileType *p = [PaymentProfileType buildPaymentProfileType:currNode];
    return p;
}

// For unit testing.
+ (GetCustomerPaymentProfileResponse *)loadGetCustomerPaymentProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    GetCustomerPaymentProfileResponse *m = [self parseGetCustomerPaymentProfileResponse:xmlData];
	
	return m;
}
@end
