//
//  GetCustomerProfileIdsResponse.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import "GetCustomerProfileIdsResponse.h"
#import "NSString+dataFromFilename.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation GetCustomerProfileIdsResponse
@synthesize ids;

+ (GetCustomerProfileIdsResponse *) getCustomerProfileIdsResponse {
	GetCustomerProfileIdsResponse *m = [[[GetCustomerProfileIdsResponse alloc] init] autorelease];
	return m;
}

- (id) init {
    self = [super init];
	if (self) {
        self.ids = [NSMutableArray array];
	}
	return self;
}

- (void) dealloc {
    self.ids = nil;
    
	[super dealloc];
}

- (NSString *) description {
	
	NSString *output = [NSString stringWithFormat:@""
						"GetCustomerProfileIdsResponse.anetApiResponse = %@\n"
                        "GetCustomerProfileIdsResponse.ids = %@\n",
						self.anetApiResponse,
                        self.ids];
	return output;
}

+ (GetCustomerProfileIdsResponse *)parseGetCustomerProfileIdsResponse:(NSData *)xmlData {
	NSError *error;
	
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc] initWithData:xmlData 
														   options:0 
															 error:&error] autorelease];
	
	NSLog(@"Error = %@", error);
	
    if (doc == nil) { return nil; }
	
	GetCustomerProfileIdsResponse *g = [GetCustomerProfileIdsResponse getCustomerProfileIdsResponse];
	
	g.anetApiResponse = [ANetApiResponse buildANetApiResponse:doc.rootElement];
    
    
    NSArray *currArray = [doc.rootElement elementsForName:@"ids"];
	GDataXMLElement *currNode = (GDataXMLElement *) [currArray objectAtIndex:0];
	currArray = [currNode elementsForName:@"numericString"];
	for (GDataXMLElement *node in currArray) {
		[g.ids addObject:node.stringValue];
	}

	
	NSLog(@"GetCustomerProfileIdsResponse: %@", g);
	
    return g;
}

// For unit testing.
+ (GetCustomerProfileIdsResponse *)loadGetCustomerProfileIdsResponseFromFilename:(NSString *)filename {
    NSString *filePath = [NSString dataFromFilename:filename];
	
    NSData *xmlData = [[[NSMutableData alloc] initWithContentsOfFile:filePath] autorelease];
    GetCustomerProfileIdsResponse *m = [self parseGetCustomerProfileIdsResponse:xmlData];
	
	return m;
}
@end
