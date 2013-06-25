//
//  DeleteCustomerPaymentProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "DeleteCustomerPaymentProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation DeleteCustomerPaymentProfileResponse

+ (DeleteCustomerPaymentProfileResponse *) deleteCustomerPaymentProfileResponse {
	DeleteCustomerPaymentProfileResponse *m = [[[DeleteCustomerPaymentProfileResponse alloc] init] autorelease];
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
						"DeleteCustomerPaymentProfileResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (DeleteCustomerPaymentProfileResponse *)parseDeleteCustomerPaymentProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	DeleteCustomerPaymentProfileResponse *g = [DeleteCustomerPaymentProfileResponse deleteCustomerPaymentProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"DeleteCustomerPaymentProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (DeleteCustomerPaymentProfileResponse *)loadDeleteCustomerPaymentProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    DeleteCustomerPaymentProfileResponse *m = [self parseDeleteCustomerPaymentProfileResponse:xmlData];
	
	return m;
}
@end
