//
//  UpdateCustomerPaymentProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "UpdateCustomerPaymentProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation UpdateCustomerPaymentProfileResponse

+ (UpdateCustomerPaymentProfileResponse *) updateCustomerPaymentProfileResponse {
	UpdateCustomerPaymentProfileResponse *m = [[[UpdateCustomerPaymentProfileResponse alloc] init] autorelease];
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
						"UpdateCustomerPaymentProfileResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (UpdateCustomerPaymentProfileResponse *)parseUpdateCustomerPaymentProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	UpdateCustomerPaymentProfileResponse *g = [UpdateCustomerPaymentProfileResponse updateCustomerPaymentProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"UpdateCustomerPaymentProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (UpdateCustomerPaymentProfileResponse *)loadUpdateCustomerPaymentProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    UpdateCustomerPaymentProfileResponse *m = [self parseUpdateCustomerPaymentProfileResponse:xmlData];
	
	return m;
}
@end
