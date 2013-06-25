//
//  GetCustomerShippingAddressResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"
#import "CustomerAddressType.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a GetCustomerShippingAddress transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface GetCustomerShippingAddressResponse : AuthNetResponse {

}

@property (nonatomic, retain) CustomerAddressType* address;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (GetCustomerShippingAddressResponse *) getCustomerShippingAddressResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * GetCustomerShippingAddressResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed GetCustomerShippingAddressResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (GetCustomerShippingAddressResponse *)parseGetCustomerShippingAddressResponse:(NSData *)xmlData;

// For unit testing.
+ (GetCustomerShippingAddressResponse *)loadGetCustomerShippingAddressResponseFromFilename:(NSString *)filename;

@end
