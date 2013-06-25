//
//  DeleteCustomerShippingAddressResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a DeleteCustomerShippingAddress transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface DeleteCustomerShippingAddressResponse : AuthNetResponse {

}

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (DeleteCustomerShippingAddressResponse *) deleteCustomerShippingAddressResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * DeleteCustomerShippingAddressResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed DeleteCustomerShippingAddressResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (DeleteCustomerShippingAddressResponse *)parseDeleteCustomerShippingAddressResponse:(NSData *)xmlData;

// For unit testing.
+ (DeleteCustomerShippingAddressResponse *)loadDeleteCustomerShippingAddressResponseFromFilename:(NSString *)filename;

@end
