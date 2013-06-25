//
//  CustomerProfileBaseType.m
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/20/13.
//
//

#import "CustomerProfileBaseType.h"
#import "NSString+stringWithXMLTag.h"

@implementation CustomerProfileBaseType

@synthesize merchantCustomerId;
@synthesize desc;
@synthesize email;
@synthesize customerProfileId; 

+ (CustomerProfileBaseType *) customerProfileBaseType {
    CustomerProfileBaseType *c = [[[CustomerProfileBaseType alloc] init] autorelease];
    return c;
}

- (id) init {
    self = [super init];
    if (self) {
        self.merchantCustomerId = nil;
        self.desc = nil;
        self.email = nil;
        self.customerProfileId = nil;
    }
    return self;
}

- (NSString *) description {
    NSString *output = [NSString stringWithFormat:@""
                        @"CreateCustomerProfile.merchantCustomerId = %@"
                        @"CreateCustomerProfile.description = %@"
                        @"CreateCustomerProfile.email = %@"
                        @"CreateCustomerProfile.customerProfileId = %@",
                        self.merchantCustomerId,
                        self.description,
                        self.email,
                        self.customerProfileId];
    return output;
    
}

- (NSString *) stringOfXMLRequest {
    NSString *s = [NSString stringWithFormat:@""
                   @"<profile>"
                   @"%@"       //merchantCustomerId
                   @"%@"       //description
                   @"%@"       //email
                   @"%@"       //customerProfileId
                   @"</profile>",
                   [NSString stringWithXMLTag:@"merchantCustomerId" andValue:self.merchantCustomerId],
                   [NSString stringWithXMLTag:@"description" andValue:self.desc],
                   [NSString stringWithXMLTag:@"email" andValue:self.email],
                   ((self.customerProfileId == nil)?@"":[NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId])];
    return s;
}

- (void) dealloc {
    self.merchantCustomerId = nil;
    self.desc = nil;
    self.email = nil;
    self.customerProfileId = nil;
    
    [super dealloc];
}

@end
