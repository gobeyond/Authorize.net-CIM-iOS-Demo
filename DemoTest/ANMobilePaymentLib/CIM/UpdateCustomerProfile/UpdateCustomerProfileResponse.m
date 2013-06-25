//
//  UpdateCustomerProfileResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "UpdateCustomerProfileResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation UpdateCustomerProfileResponse

+ (UpdateCustomerProfileResponse *) updateCustomerProfileResponse {
	UpdateCustomerProfileResponse *m = [[[UpdateCustomerProfileResponse alloc] init] autorelease];
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
						"UpdateCustomerProfileResponse.anetApiResponse = %@\n",
						self.anetApiResponse];
	return output;
}

+ (UpdateCustomerProfileResponse *)parseUpdateCustomerProfileResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	UpdateCustomerProfileResponse *g = [UpdateCustomerProfileResponse updateCustomerProfileResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
	
	NSLog(@"UpdateCustomerProfileResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (UpdateCustomerProfileResponse *)loadUpdateCustomerProfileResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    UpdateCustomerProfileResponse *m = [self parseUpdateCustomerProfileResponse:xmlData];
	
	return m;
}
@end
