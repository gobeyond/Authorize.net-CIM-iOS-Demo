//
//  UpdateCustomerPaymentProfileRequest.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetRequest.h"
#import "PaymentProfileType.h"
#import "ValidationModes.h"

/**
 * Requst object that has pointers to each of the different objects
 * required in a UpdateCustomerPaymentProfile request.
 * NOTE: Consult Authorize.Net guide for the minimal fields required for the UpdateCustomerPaymentProfile request..
 */
@interface UpdateCustomerPaymentProfileRequest : AuthNetRequest {
}

@property (nonatomic, retain) PaymentProfileType* paymentProfile;
@property (nonatomic) VALIDATION_MODE validationMode; 

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (UpdateCustomerPaymentProfileRequest *) updateCustomerPaymentProfileRequest;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;
@end
