//
//  CreateCustomerProfileResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a CreateCustomerProfile transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface CreateCustomerProfileResponse : AuthNetResponse {

}

@property (nonatomic, retain) NSString* customerProfileId;
@property (nonatomic, retain) NSMutableArray* customerPaymentProfileIdList;
@property (nonatomic, retain) NSMutableArray* customerShippingAddressIdList;
@property (nonatomic, retain) NSMutableArray* validationDirectResponseList; 


/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CreateCustomerProfileResponse *) createCustomerProfileResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * CreateCustomerProfileResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed CreateCustomerProfileResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (CreateCustomerProfileResponse *)parseCreateCustomerProfileResponse:(NSData *)xmlData;

// For unit testing.
+ (CreateCustomerProfileResponse *)loadCreateCustomerProfileResponseFromFilename:(NSString *)filename;

@end
