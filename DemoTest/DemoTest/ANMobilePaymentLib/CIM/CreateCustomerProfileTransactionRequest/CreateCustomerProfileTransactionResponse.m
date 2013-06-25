//
//  CreateCustomerProfileTransactionResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CreateCustomerProfileTransactionResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation CreateCustomerProfileTransactionResponse
@synthesize directResponse; 

+ (CreateCustomerProfileTransactionResponse *) createCustomerProfileTransactionResponse {
	CreateCustomerProfileTransactionResponse *m = [[[CreateCustomerProfileTransactionResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.directResponse = nil;
	}
	return self;
}

- (void) dealloc {
    self.directResponse = nil;
    
	[super dealloc];
}

- (NSString *) description {
	NSString *output = [NSString stringWithFormat:@""
						"CreateCustomerProfileTransactionResponse.anetApiResponse = %@\n"
                        "CreateCustomerProfileTransactionResponse.directResponse = %@\n",
						self.anetApiResponse,
                        self.directResponse];
	return output;
}

+ (CreateCustomerProfileTransactionResponse *)parseCreateCustomerProfileTransactionResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	CreateCustomerProfileTransactionResponse *g = [CreateCustomerProfileTransactionResponse createCustomerProfileTransactionResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    g.directResponse = [NSString stringValueOfXMLElement:doc.rootElement withName:@"directResponse"];
	
	NSLog(@"CreateCustomerProfileTransactionResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (CreateCustomerProfileTransactionResponse *)loadCreateCustomerProfileTransactionResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    CreateCustomerProfileTransactionResponse *m = [self parseCreateCustomerProfileTransactionResponse:xmlData];
	
	return m;
}
@end
