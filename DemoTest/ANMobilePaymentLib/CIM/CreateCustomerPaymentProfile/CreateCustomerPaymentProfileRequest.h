//
//  CreateCustomerPaymentProfileRequest.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetRequest.h"
#import "CustomerProfileBaseType.h"
#import "PaymentProfileType.h"
#import "PaymentType.h"
#import "ValidationModes.h"

/**
 * Requst object that has pointers to each of the different objects
 * required in a CreateCustomerPaymentProfile request.
 * NOTE: Consult Authorize.Net guide for the minimal fields required for the CreateCustomerPaymentProfile request..
 */
@interface CreateCustomerPaymentProfileRequest : AuthNetRequest {
}

@property (nonatomic, retain) NSString* customerProfileId;
@property (nonatomic, retain) PaymentProfileType* paymentProfile;
@property (nonatomic, retain) PaymentType* payment;
@property (nonatomic) VALIDATION_MODE validationMode; 

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CreateCustomerPaymentProfileRequest *) createCustomerPaymentProfileRequest;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;
@end
