//
//  DeleteCustomerProfileResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a DeleteCustomerProfile transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface DeleteCustomerProfileResponse : AuthNetResponse {

}


/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (DeleteCustomerProfileResponse *) deleteCustomerProfileResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * DeleteCustomerProfileResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed DeleteCustomerProfileResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (DeleteCustomerProfileResponse *)parseDeleteCustomerProfileResponse:(NSData *)xmlData;

// For unit testing.
+ (DeleteCustomerProfileResponse *)loadDeleteCustomerProfileResponseFromFilename:(NSString *)filename;

@end
