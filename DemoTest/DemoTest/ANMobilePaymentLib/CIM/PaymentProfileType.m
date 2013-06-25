//
//  PaymentProfileType.m
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/24/13.
//
//

#import "PaymentProfileType.h"
#import "NSString+stringWithXMLTag.h"
#import "NSString+stringValueOfXMLElement.h"

@implementation PaymentProfileType
@synthesize customerPaymentProfileId;
@synthesize billTo;
@synthesize creditCard;

+ (PaymentProfileType *) paymentProfileType {
    PaymentProfileType *p = [[[PaymentProfileType alloc] init] autorelease];
    return p;
}

- (id) init {
    self = [super init];
    if (self) {
        self.customerPaymentProfileId = nil;
        self.billTo = nil;
        self.creditCard = nil;
    }
    return self;
}

- (NSString *) description {
    NSString *output = [NSString stringWithFormat:@"PaymentProfileType = "
                        @"customerPaymentProfileId = %@"
                        @"billTo = %@"
                        @"creditCard = %@",
                        self.customerPaymentProfileId,
                        (self.billTo?[self.billTo description]:@""),
                        (self.creditCard?[self.creditCard description]:@"")];
    return output;
    
}

- (NSString *) stringOfXMLRequest {
    NSString *s = [NSString stringWithFormat:@""
                   @"<paymentProfile>"
                   @"%@"       //customerPaymentProfileId
                   @"%@"       //billTo
                   @"%@"       //creditCard
                   @"</paymentProfile>",
                   ((self.customerPaymentProfileId)?[NSString stringWithXMLTag:@"customerPaymentProfileId" andValue:self.customerPaymentProfileId]:@""),
                   [NSString stringWithXMLTag:@"billTo" andValue:[self.billTo stringOfXMLRequest]],
                   [NSString stringWithXMLTag:@"payment" andValue:[self.creditCard stringOfXMLRequest]]];
    return s;
}

+ (PaymentProfileType *) buildPaymentProfileType:(GDataXMLElement *)element {
	PaymentProfileType *p = [PaymentProfileType paymentProfileType];

	p.customerPaymentProfileId = [NSString stringValueOfXMLElement:element withName:@"customerPaymentProfileId"];
    
    NSArray *currArray = [element elementsForName:@"billTo"];
	GDataXMLElement *childNode = [currArray objectAtIndex:0];
	p.billTo = [CustomerAddressType buildCustomerAddressType:childNode];
    
    currArray = [element elementsForName:@"payment"];
	childNode = [currArray objectAtIndex:0];
    p.creditCard = [CreditCardType buildCreditCardType:childNode];
	
	return p;
}

- (void) dealloc {
    self.customerPaymentProfileId = nil;
    self.billTo = nil;
    self.creditCard = nil;
    
    [super dealloc];
}

@end
