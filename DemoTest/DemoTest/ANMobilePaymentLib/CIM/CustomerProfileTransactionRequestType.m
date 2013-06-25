//
//  CustomerProfileTransactionRequestType.m
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/23/11.
//  Copyright 2011 none. All rights reserved.
//

#import "CustomerProfileTransactionRequestType.h"
#import "NSString+stringWithXMLTag.h"


@implementation CustomerProfileTransactionRequestType

@synthesize transactionType;
@synthesize amount;
@synthesize tax;
@synthesize shipping;
@synthesize lineItems;
@synthesize order;
@synthesize taxExempt;

//@synthesize payment;
//@synthesize authCode;
//@synthesize duty;
//@synthesize refTransId;
//@synthesize splitTenderId;
//@synthesize poNumber;
//@synthesize customer;
//@synthesize billTo;
//@synthesize shipTo;
//@synthesize customerIP;
//@synthesize retail;
//@synthesize transactionSettings;
//@synthesize userFields;

#pragma mark -
@synthesize customerProfileId;
@synthesize customerPaymentProfileId;
@synthesize customerShippingAddressId;
@synthesize recurringBilling;
@synthesize cardCode;
@synthesize approvalCode;
@synthesize transId;
@synthesize creditCardNumberMasked;


+ (CustomerProfileTransactionRequestType *) customerProfileTransactionRequestType {
    CustomerProfileTransactionRequestType *t = [[[CustomerProfileTransactionRequestType alloc] init] autorelease];
    return t;
}

- (id) init {
    self = [super init];
    if (self) {
        self.transactionType = nil;
        self.amount = nil;
        self.tax = [ExtendedAmountType extendedAmountType];
        self.shipping = [ExtendedAmountType extendedAmountType];
        self.lineItems = [NSMutableArray array];
        self.order = [OrderType order];
        self.taxExempt = nil;
        
        self.customerProfileId = nil;
        self.customerPaymentProfileId = nil;
        self.customerShippingAddressId = nil;
        self.cardCode = nil;
        self.approvalCode = nil;
        self.transId = nil;
        self.creditCardNumberMasked = nil;
    }
    return self;
}

- (void) dealloc {
    self.transactionType = nil;
    self.amount = nil;
    self.tax = nil;
    self.shipping = nil;
    self.lineItems = nil;
    self.order = nil;
    self.taxExempt = nil;
    
    self.customerProfileId = nil;
    self.customerPaymentProfileId = nil;
    self.customerShippingAddressId = nil;
    self.cardCode = nil;
    self.approvalCode = nil;
    self.transId = nil;
    self.creditCardNumberMasked = nil;
    [super dealloc];
}

- (NSString *) description {
    NSString *output = [NSString stringWithFormat:@""
                        @"self.transactionType = %@"
                        @"self.amount = %@"
                        @"self.tax = %@"
                        @"self.shipping = %@"
                        @"self.lineItems = %@"
                        @"self.order = %@"
                        @"self.taxExempt = %@"
                        
                        @"self.customerProfileId = %@"
                        @"self.customerPaymentProfileId = %@"
                        @"self.customerShippingAddressId = %@"
                        @"self.cardCode = %@"
                        @"self.approvalCode = %@"
                        @"self.transId = %@"
                        @"self.creditCardNumberMasked = %@",
                        self.transactionType,
                        self.amount,
                        self.tax,
                        self.shipping,
                        self.lineItems,
                        self.order,
                        self.taxExempt,
                        
                        self.customerProfileId,
                        self.customerPaymentProfileId,
                        self.customerShippingAddressId,
                        self.cardCode,
                        self.approvalCode,
                        self.transId,
                        self.creditCardNumberMasked
                        ];
    return output;
}

- (NSString *)stringOfXMLRequest {
    
    // create the lineItem XML
    NSString *ls = [NSMutableString string];
    for (LineItemType *l in self.lineItems) {
        ls = [ls stringByAppendingFormat:@"%@", [l stringOfXMLRequest]];
    }

    NSString *s = [NSString stringWithFormat:@""
                   @"<%@>"          //transactionType
                        @"%@"       //amount,
                        @"%@"       //tax,
                        @"%@"       //shipping,
                        @"<lineItems>%@</lineItems>"       //lineItems,
                        @"%@"       //order,
                        @"%@"       //taxExempt,
                        @"%@"       //customerProfileId,
                        @"%@"       //customerPaymentProfileId,
                        @"%@"       //customerShippingAddressId,
                        @"<recurringBilling>%@</recurringBilling>"       //recurringBilling,
                        @"%@"       //cardCode,
                        @"%@"       //approvalCode,
                        @"%@"       //transId,
                        @"%@"       //creditCardNumberMasked,
                   @"</%@>",
                   self.transactionType,
                   (self.amount?[NSString stringWithXMLTag:@"amount" andValue:self.amount] : @""),
                   (self.tax.amount ? [NSString stringWithFormat:@"<tax>%@</tax>", [self.tax stringOfXMLRequest]] : @""),
                   (self.shipping.amount ? [NSString stringWithFormat:@"<shipping>%@</shipping>", [self.shipping stringOfXMLRequest]] : @""),
                   ls,
                   (self.order?[self.order stringOfXMLRequest]:@""),
                   (self.taxExempt?[NSString stringWithXMLTag:@"taxExempt" andValue:self.taxExempt]:@""),
                   [NSString stringWithXMLTag:@"customerProfileId" andValue:self.customerProfileId],
                   [NSString stringWithXMLTag:@"customerPaymentProfileId" andValue:self.customerPaymentProfileId],
                   [NSString stringWithXMLTag:@"customerShippingAddressId" andValue:self.customerShippingAddressId],
                   (recurringBilling ? @"true" : @"false"),
                   (self.cardCode ? [NSString stringWithXMLTag:@"cardCode" andValue:self.cardCode] : @""),
                   (self.approvalCode ? [NSString stringWithXMLTag:@"approvalCode" andValue:self.approvalCode] : @""),
                   (self.transId ? [NSString stringWithXMLTag:@"transId" andValue:self.transId] : @""),
                   (self.creditCardNumberMasked ? [NSString stringWithXMLTag:@"creditCardNumberMasked" andValue:self.creditCardNumberMasked] : @""),
                   

//                   (self.payment ? [self.payment stringOfXMLRequest] : @""),
//                   [NSString stringWithXMLTag:@"authCode" andValue:self.authCode],
//                   [NSString stringWithXMLTag:@"refTransId" andValue:self.refTransId],
//                   [NSString stringWithXMLTag:@"splitTenderId" andValue:self.splitTenderId],
//                   (self.duty.amount ? [NSString stringWithFormat:@"<duty>%@</duty>", [self.duty stringOfXMLRequest]] : @""),
//                   [NSString stringWithXMLTag:@"poNumber" andValue:self.poNumber],
//                   [self.customer stringOfXMLRequest],
//                   [self.billTo stringOfXMLRequest],
//                   [self.shipTo stringOfXMLRequest],
//                   [NSString stringWithXMLTag:@"customerIP" andValue:self.customerIP],
//                   (retail.marketType ? [NSString stringWithFormat:@"<retail>%@</retail>", [self.retail stringOfXMLRequest]] : @""),
//                   ts,
//                   us,
                   self.transactionType];
    
    return s;
                   
}
@end
