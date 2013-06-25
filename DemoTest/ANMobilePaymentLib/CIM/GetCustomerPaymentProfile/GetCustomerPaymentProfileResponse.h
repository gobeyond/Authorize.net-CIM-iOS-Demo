//
//  GetCustomerPaymentProfileResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"
#import "PaymentProfileType.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a GetCustomerPaymentProfile transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface GetCustomerPaymentProfileResponse : AuthNetResponse {

}

@property (nonatomic, retain) PaymentProfileType* paymentProfileType;

- (NSString *) description;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (GetCustomerPaymentProfileResponse *) getCustomerPaymentProfileResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * GetCustomerPaymentProfileResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed GetCustomerPaymentProfileResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (GetCustomerPaymentProfileResponse *)parseGetCustomerPaymentProfileResponse:(NSData *)xmlData;

// For unit testing.
+ (GetCustomerPaymentProfileResponse *)loadGetCustomerPaymentProfileResponseFromFilename:(NSString *)filename;

@end
