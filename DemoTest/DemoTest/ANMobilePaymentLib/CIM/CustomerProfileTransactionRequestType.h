//
//  CustomerProfileTransactionRequestType.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/23/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentType.h"
#import "ExtendedAmountType.h"
#import "CustomerDataType.h"
#import "CustomerAddressType.h"
#import "LineItemType.h"
#import "NameAndAddressType.h"
#import "OrderType.h"
#import "SettingType.h"
#import "TransRetailInfoType.h"
#import "UserField.h"

@interface CustomerProfileTransactionRequestType : NSObject {
    NSString *transactionType;
    NSString *amount;
    ExtendedAmountType *tax;
    ExtendedAmountType *shipping;
    NSMutableArray *lineItems;
    OrderType *order;
    NSString *taxExempt;
    
//    PaymentType *payment;
//    NSString *authCode;
//    NSString *refTransId;
//    NSString *splitTenderId;
//    ExtendedAmountType *duty;
//    NSString *poNumber;
//    CustomerDataType *customer;
//    CustomerAddressType *billTo;
//    NameAndAddressType *shipTo;
//    NSString *customerIP;
//    TransRetailInfoType *retail;
//    NSMutableArray *transactionSettings;
//    NSMutableArray *userFields;
}


@property (nonatomic, retain) NSString *transactionType;
@property (nonatomic, retain) NSString *amount;
@property (nonatomic, retain) ExtendedAmountType *tax;
@property (nonatomic, retain) ExtendedAmountType *shipping;
@property (nonatomic, retain) NSMutableArray *lineItems;
@property (nonatomic, retain) OrderType *order;
@property (nonatomic, retain) NSString *taxExempt;

//@property (nonatomic, retain) PaymentType *payment;
//@property (nonatomic, retain) NSString *authCode;
//@property (nonatomic, retain) NSString *refTransId;
//@property (nonatomic, retain) NSString *splitTenderId;
//@property (nonatomic, retain) ExtendedAmountType *duty;
//@property (nonatomic, retain) NSString *poNumber;
//@property (nonatomic, retain) CustomerDataType *customer;
//@property (nonatomic, retain) CustomerAddressType *billTo;
//@property (nonatomic, retain) NameAndAddressType *shipTo;
//@property (nonatomic, retain) NSString *customerIP;
//@property (nonatomic, retain) TransRetailInfoType *retail;
//@property (nonatomic, retain) NSMutableArray *transactionSettings;
//@property (nonatomic, retain) NSMutableArray *userFields;


#pragma mark -
// authOnly/AuthAndCapture/CaptureOnly/PriorAuthCapture/Refund/Void transaction
@property (nonatomic, retain) NSString* customerProfileId;
@property (nonatomic, retain) NSString* customerPaymentProfileId;
@property (nonatomic, retain) NSString* customerShippingAddressId;

// authOnly/AuthAndCapture/CaptureOnly transaction
@property (nonatomic, assign) bool recurringBilling;
@property (nonatomic, retain) NSString* cardCode;

// CaptureOnly transaction
@property (nonatomic, retain) NSString* approvalCode;

// PriorAuthCapture/Refund/Void transaction
@property (nonatomic, retain) NSString* transId;

//Refund transaction
@property (nonatomic, retain) NSString* creditCardNumberMasked;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CustomerProfileTransactionRequestType *) customerProfileTransactionRequestType;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *)stringOfXMLRequest;
@end
