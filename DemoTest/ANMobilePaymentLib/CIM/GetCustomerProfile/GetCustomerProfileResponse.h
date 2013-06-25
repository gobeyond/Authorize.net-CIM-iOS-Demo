//
//  GetCustomerProfileResponse.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetResponse.h"

/**
 * Response object that has pointers to each of the different objects
 * required in a GetCustomerProfile transaction.
 * NOTE: Consult Authorize.Net Guide for the minimal fields required for each transaction type.
 */
@interface GetCustomerProfileResponse : AuthNetResponse {

}

@property (nonatomic, retain) NSString* merchantCustomerId;
@property (nonatomic, retain) NSString* description;
@property (nonatomic, retain) NSString* email;
@property (nonatomic, retain) NSString* customerProfileId;
@property (nonatomic, retain) NSMutableArray* paymentProfiles;
//@property (nonatomic, retain) CustomerAddressType* billTo;
//@property (nonatomic, retain) NSString* customerPaymentProfileId;
//@property (nonatomic, retain) CreditCardType* creditCard;
@property (nonatomic, retain) NSMutableArray* shipToList;
//@property (nonatomic, retain) CustomerAddressType* customerAddressType



/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (GetCustomerProfileResponse *) getCustomerProfileResponse;

/**
 * Class method that takes in NSData and returns a fully parsed
 * GetCustomerProfileResponse.  If the method was not able to parse the response,
 * a nil object is returned.
 * @return The parsed GetCustomerProfileResponse from parsing the NSData or nil if unable
 * to parse the data.
 */
+ (GetCustomerProfileResponse *)parseGetCustomerProfileResponse:(NSData *)xmlData;

// For unit testing.
+ (GetCustomerProfileResponse *)loadGetCustomerProfileResponseFromFilename:(NSString *)filename;

@end
