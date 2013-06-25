//
//  CreateCustomerPaymentProfileResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a CreateCustomerPaymentProfile transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface CreateCustomerPaymentProfileResponse : AuthNetResponse {

}

@property (nonatomic, retain) NSString* customerPaymentProfileId;
@property (nonatomic, retain) NSString* validationDirectResponse;


/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CreateCustomerPaymentProfileResponse *) createCustomerPaymentProfileResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * CreateCustomerPaymentProfileResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed CreateCustomerPaymentProfileResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (CreateCustomerPaymentProfileResponse *)parseCreateCustomerPaymentProfileResponse:(NSData *)xmlData;

// For unit testing.
+ (CreateCustomerPaymentProfileResponse *)loadCreateCustomerPaymentProfileResponseFromFilename:(NSString *)filename;

@end
