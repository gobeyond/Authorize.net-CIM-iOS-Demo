//
//  DeleteCustomerProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "DeleteCustomerProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation DeleteCustomerProfileResponse

+ (DeleteCustomerProfileResponse *) deleteCustomerProfileResponse {
	DeleteCustomerProfileResponse *m = [[[DeleteCustomerProfileResponse alloc] init] autorelease];
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
						"DeleteCustomerProfileResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (DeleteCustomerProfileResponse *)parseDeleteCustomerProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	DeleteCustomerProfileResponse *g = [DeleteCustomerProfileResponse deleteCustomerProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"DeleteCustomerProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (DeleteCustomerProfileResponse *)loadDeleteCustomerProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    DeleteCustomerProfileResponse *m = [self parseDeleteCustomerProfileResponse:xmlData];
	
	return m;
}
@end
